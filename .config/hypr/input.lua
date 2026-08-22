hl.config({
  input = {
    kb_layout          = "us",
    kb_options         = "compose:ralt",
    repeat_rate        = 40,
    repeat_delay       = 600,
    numlock_by_default = true,
    touchpad = { scroll_factor = 0.4 },
  },
  misc = {
    key_press_enables_dpms  = true,
    mouse_move_enables_dpms = true,
  },
})

hl.window_rule({
  name = "terminal-scroll",
  match = { class = "(Alacritty|kitty)" },
  scroll_touchpad = 1.5,
})

hl.window_rule({
  name = "ghostty-scroll",
  match = { class = "com.mitchellh.ghostty" },
  scroll_touchpad = 0.2,
})
