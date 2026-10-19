// Hot-reloads the matugen palette + wallpaper that spicetify-matugen-sync
// writes into xpui/matugen/, so theme switches apply without restarting Spotify.
(function matugen() {
    const BASE = "/matugen/";
    const POLL_MS = 2000;
    const WALLPAPER_OPACITY = "0.4";

    const link = document.createElement("link");
    link.rel = "stylesheet";
    document.head.appendChild(link);
    let currentStamp = null;

    // SpoTUI's hardcoded colours → matugen tokens from theme.css. Chromium
    // serialises parsed colours as rgb(); custom props and var() values keep
    // their raw hex, so both spellings are listed.
    const RECOLOR = [
        ["--mg-bg", ["#000", "#000000", "#111", "#111111", "#121212", "rgb(0, 0, 0)", "rgb(17, 17, 17)", "rgb(18, 18, 18)"]],
        ["--mg-surface-high", ["#202020", "#222", "#222222", "#2a2a2a", "rgb(32, 32, 32)", "rgb(34, 34, 34)", "rgb(42, 42, 42)"]],
        ["--mg-text", ["#ddd", "#dddddd", "rgb(221, 221, 221)"]],
        ["--mg-subtext", ["#b3b3b3", "#b8b8b8", "#888", "rgb(179, 179, 179)", "rgb(184, 184, 184)", "rgb(136, 136, 136)"]],
        ["--mg-outline", ["#777", "#777777", "#555555", "rgb(119, 119, 119)", "rgb(85, 85, 85)"]],
        ["--mg-accent", ["#ff8c42", "#ff8c1a", "#e07b39", "rgb(255, 140, 66)", "rgb(255, 140, 26)", "rgb(224, 123, 57)"]],
        ["--mg-error", ["#ff5555", "#ef4444", "rgb(255, 85, 85)", "rgb(239, 68, 68)"]],
    ];
    const escapeRe = (text) => text.replace(/[()]/g, "\\$&");
    const COLOR_RE = new RegExp(
        `(?:${RECOLOR.flatMap(([, colors]) => colors.map(escapeRe)).join("|")})(?![0-9a-f])`,
        "gi",
    );
    const TOKEN_FOR = new Map(RECOLOR.flatMap(([token, colors]) => colors.map((c) => [c, `var(${token})`])));
    const ACCENT_ALPHA_RE = /rgba\(255, 140, 66, ([\d.]+)\)/g;
    const recoloredSheets = new WeakSet();

    function recolorRules(rules) {
        for (const rule of rules) {
            if (rule.cssRules) recolorRules(rule.cssRules); // @media etc.
            if (!rule.style) continue;
            for (const prop of Array.from(rule.style)) {
                const value = rule.style.getPropertyValue(prop);
                const recolored = value
                    .replace(ACCENT_ALPHA_RE, "rgb(var(--spotui-accent-rgb) / $1)")
                    .replace(COLOR_RE, (color) => TOKEN_FOR.get(color.toLowerCase()));
                if (recolored !== value) {
                    rule.style.setProperty(prop, recolored, rule.style.getPropertyPriority(prop));
                }
            }
        }
    }

    // Only SpoTUI's <style> tags (Marketplace's marketplaceUserCSS + the ones
    // theme.js injects); Spotify's own stylesheets are <link>s and stay untouched.
    function recolorSpotuiSheets() {
        for (const sheet of document.styleSheets) {
            const owner = sheet.ownerNode;
            if (recoloredSheets.has(sheet) || owner?.tagName !== "STYLE" || !owner.textContent.includes("spotui")) continue;
            recoloredSheets.add(sheet);
            recolorRules(sheet.cssRules);
        }
    }

    // Mirrors SpoTUI's setWallpaper(): its layer only exists after `tui -wp`,
    // so create it ourselves; theme.css supplies the image.
    function ensureWallpaperLayer() {
        const tui = document.getElementById("spotui-tui");
        if (!tui || document.getElementById("spotui-wallpaper")) return;
        const wp = document.createElement("div");
        wp.id = "spotui-wallpaper";
        Object.assign(wp.style, {
            position: "absolute", top: "0", left: "0", width: "100%", height: "100%",
            zIndex: "-1", backgroundSize: "cover", backgroundPosition: "center",
            opacity: WALLPAPER_OPACITY,
        });
        tui.prepend(wp);
        tui.style.backgroundColor = "transparent";
        tui.querySelectorAll(":not(#spotui-wallpaper)").forEach((child) => {
            if (getComputedStyle(child).position === "static") child.style.position = "relative";
            child.style.zIndex = "1";
        });
    }

    async function poll() {
        ensureWallpaperLayer();
        recolorSpotuiSheets();
        let res;
        try {
            res = await fetch(`${BASE}version?t=${Date.now()}`, { cache: "no-store" });
        } catch (err) {
            console.warn("matugen: version fetch failed", err);
            return;
        }
        if (!res.ok) return; // not synced yet; spicetify-matugen-sync hasn't run
        const stamp = (await res.text()).trim();
        if (stamp === currentStamp) return;
        currentStamp = stamp;
        link.href = `${BASE}theme.css?v=${stamp}`;
    }

    poll();
    setInterval(poll, POLL_MS);
})();
