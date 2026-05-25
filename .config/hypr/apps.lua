hl.window_rule({
  name = "floating-window-style",
  match = { tag = "floating-window" },
  float = true,
  center = true,
  size = "875 600",
})

hl.window_rule({
  name = "tag-floating-tui",
  match = { class = "(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)" },
  tag = "+floating-window",
})

hl.window_rule({
  name = "tag-floating-file-dialogs",
  match = {
    class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
    title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
  },
  tag = "+floating-window",
})

hl.window_rule({
  name = "calculator-float",
  match = { class = "org.gnome.Calculator" },
  float = true,
})

hl.window_rule({
  name = "screensaver",
  match = { class = "org.omarchy.screensaver" },
  fullscreen = true,
  float = true,
  animation = "slide",
})

hl.window_rule({
  name = "opaque-media-apps",
  match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" },
  tag = "-default-opacity",
  opacity = "1 1",
})

hl.window_rule({
  name = "pop-rounding",
  match = { tag = "pop" },
  rounding = 8,
})

hl.window_rule({
  name = "noidle-inhibit",
  match = { tag = "noidle" },
  idle_inhibit = "always",
})

hl.window_rule({
  name = "tag-terminal",
  match = { class = "(Alacritty|kitty|com.mitchellh.ghostty)" },
  tag = "+terminal",
})

hl.window_rule({
  name = "terminal-opacity",
  match = { tag = "terminal" },
  tag = "-default-opacity",
  opacity = "0.97 0.9",
})

hl.window_rule({
  name = "tag-chromium-browser",
  match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" },
  tag = "+chromium-based-browser",
})

hl.window_rule({
  name = "tag-firefox-browser",
  match = { class = "([fF]irefox|zen|librewolf)" },
  tag = "+firefox-based-browser",
})

hl.window_rule({
  name = "chromium-no-default-opacity",
  match = { tag = "chromium-based-browser" },
  tag = "-default-opacity",
})

hl.window_rule({
  name = "firefox-no-default-opacity",
  match = { tag = "firefox-based-browser" },
  tag = "-default-opacity",
})

hl.window_rule({
  name = "untag-chrome-webapps",
  match = { class = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" },
  tag = "-chromium-based-browser",
})

hl.window_rule({
  name = "chrome-webapps-no-default-opacity",
  match = { class = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" },
  tag = "-default-opacity",
})

hl.window_rule({
  name = "chromium-tile",
  match = { tag = "chromium-based-browser" },
  tile = true,
})

hl.window_rule({
  name = "chromium-opacity",
  match = { tag = "chromium-based-browser" },
  opacity = "1.0 0.97",
})

hl.window_rule({
  name = "firefox-opacity",
  match = { tag = "firefox-based-browser" },
  opacity = "1.0 0.97",
})

hl.window_rule({
  name = "tag-pip",
  match = { title = "(Picture.?in.?[Pp]icture)" },
  tag = "+pip",
})

hl.window_rule({
  name = "pip-style",
  match = { tag = "pip" },
  tag = "-default-opacity",
  float = true,
  pin = true,
  size = "600 338",
  keep_aspect_ratio = true,
  border_size = 0,
  opacity = "1 1",
  move = "(monitor_w-window_w-40) (monitor_h*0.04)",
})

hl.window_rule({
  name = "bitwarden",
  match = { class = "^(Bitwarden)$" },
  no_screen_share = true,
  tag = "+floating-window",
})

hl.window_rule({
  name = "1password-extension",
  match = { class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default" },
  no_screen_share = true,
  tag = "+floating-window",
})

hl.window_rule({
  name = "steam-app-monitor",
  match = { class = "steam_app_.*" },
  monitor = "HDMI-A-1",
  immediate = true,
})

hl.window_rule({
  name = "steam-main-float",
  match = { class = "steam" },
  float = true,
})

hl.window_rule({
  name = "steam-main-window",
  match = { class = "steam", title = "Steam" },
  center = true,
  size = "1100 700",
})

hl.window_rule({
  name = "steam-friends",
  match = { class = "steam", title = "Friends List" },
  size = "460 800",
})

hl.window_rule({
  name = "steam-opacity",
  match = { class = "steam.*" },
  tag = "-default-opacity",
  opacity = "1 1",
})

hl.window_rule({
  name = "steam-idle-inhibit",
  match = { class = "steam" },
  idle_inhibit = "fullscreen",
})

hl.window_rule({
  name = "localsend-float",
  match = { class = "(Share|localsend)" },
  float = true,
  center = true,
})

hl.window_rule({
  name = "localsend-size",
  match = { class = "localsend" },
  size = "1100 700",
})

hl.window_rule({
  name = "webcam-overlay",
  match = { title = "WebcamOverlay" },
  float = true,
  pin = true,
  no_initial_focus = true,
  no_dim = true,
  move = "(monitor_w-window_w-40) (monitor_h-window_h-40)",
})

hl.layer_rule({ name = "selection-no-anim", match = { namespace = "selection" }, no_anim = true })
hl.layer_rule({ name = "walker-no-anim",    match = { namespace = "walker" },    no_anim = true })
