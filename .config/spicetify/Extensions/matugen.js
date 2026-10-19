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
