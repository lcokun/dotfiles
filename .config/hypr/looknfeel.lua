hl.config({
  general = {
    gaps_in          = 5,
    gaps_out         = 10,
    border_size      = 2,
    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },
  decoration = {
    rounding = 12,
    shadow = {
      enabled      = true,
      range        = 2,
      render_power = 3,
      color        = "rgba(1a1a1aee)",
    },
    blur = {
      enabled          = true,
      size             = 6,
      passes           = 3,
      new_optimizations = true,
      noise            = 0.01,
      contrast         = 0.9,
      brightness       = 0.8,
      popups           = true,
    },
  },
  group = {
    groupbar = {
      font_size                  = 12,
      font_family                = "monospace",
      font_weight_active         = "ultraheavy",
      font_weight_inactive       = "normal",
      indicator_height           = 0,
      indicator_gap              = 5,
      height                     = 22,
      gaps_in                    = 5,
      gaps_out                   = 0,
      text_color                 = "rgb(ffffff)",
      text_color_inactive        = "rgba(ffffff90)",
      ["col.active"]             = "rgba(00000040)",
      ["col.inactive"]           = "rgba(00000020)",
      gradients                  = true,
      gradient_rounding          = 0,
      gradient_round_only_edges  = false,
    },
  },
  animations = { enabled = true },
  -- pseudotile was a no-op and is REMOVED in 0.55, so it's dropped here.
  dwindle = {
    preserve_split = true,
    force_split    = 2,
  },
  master = { new_status = "master" },
  misc = {
    disable_hyprland_logo      = true,
    disable_splash_rendering   = true,
    focus_on_activate          = true,
    anr_missed_pings           = 3,
    on_focus_under_fullscreen  = 1,
  },
  cursor = {
    hide_on_key_press         = true,
    warp_on_change_workspace  = 1,
  },
  binds = { hide_special_on_workspace_change = true },
  layout = {},
})

hl.curve("smooth",    { type = "bezier", points = { { 0.25, 0.1  }, { 0.25, 1.0   } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0    }, { 0.66, -0.56 } } })
hl.curve("smoothIn",  { type = "bezier", points = { { 0.25, 1    }, { 0.5,  1     } } })
hl.curve("overshot",  { type = "bezier", points = { { 0.05, 0.9  }, { 0.1,  1.05  } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 4, bezier = "overshot",  style = "popin 80%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3, bezier = "smoothOut", style = "popin 80%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "fade",             enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 3, bezier = "smoothIn" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 3, bezier = "smoothOut" })
hl.animation({ leaf = "border",           enabled = true, speed = 6, bezier = "smooth" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "overshot", style = "slidevert" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3, bezier = "smooth",    style = "fade" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3, bezier = "smoothIn",  style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2, bezier = "smoothOut", style = "fade" })

hl.layer_rule({ name = "waybar-blur",         match = { namespace = "waybar" },        blur = true })
hl.layer_rule({ name = "waybar-ignorealpha",  match = { namespace = "waybar" },        ignore_alpha = 0.3 })
hl.layer_rule({ name = "walker-blur",         match = { namespace = "walker" },        blur = true })
hl.layer_rule({ name = "walker-ignorealpha",  match = { namespace = "walker" },        ignore_alpha = 0.3 })
hl.layer_rule({ name = "notif-blur",          match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ name = "notif-ignorealpha",   match = { namespace = "notifications" }, ignore_alpha = 0.3 })
