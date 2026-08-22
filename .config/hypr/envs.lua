-- Discrete NVIDIA only (iGPU disabled in BIOS); VAAPI via libva-nvidia-driver
hl.env("NVD_BACKEND",               "direct")
hl.env("LIBVA_DRIVER_NAME",         "nvidia")
hl.env("XCURSOR_SIZE",              "24")
hl.env("HYPRCURSOR_SIZE",           "24")
hl.env("GDK_BACKEND",               "wayland,x11,*")
hl.env("GDK_SCALE",                 "1")
hl.env("QT_QPA_PLATFORM",           "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE",         "kvantum")
hl.env("SDL_VIDEODRIVER",           "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND",        "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM",            "wayland")
hl.env("XDG_SESSION_TYPE",          "wayland")
hl.env("XDG_CURRENT_DESKTOP",       "Hyprland")
hl.env("XDG_SESSION_DESKTOP",       "Hyprland")
hl.env("XCOMPOSEFILE",              "~/.XCompose")

hl.env("GUM_CONFIRM_PROMPT_FOREGROUND",     "6")
hl.env("GUM_CONFIRM_SELECTED_FOREGROUND",   "0")
hl.env("GUM_CONFIRM_SELECTED_BACKGROUND",   "2")
hl.env("GUM_CONFIRM_UNSELECTED_FOREGROUND", "7")
hl.env("GUM_CONFIRM_UNSELECTED_BACKGROUND", "8")

hl.config({
  xwayland  = { force_zero_scaling = true },
  ecosystem = { no_update_news     = true },
})
