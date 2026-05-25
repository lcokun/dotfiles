hl.window_rule({
  name = "suppress-maximize",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "tag-default-opacity",
  match = { class = ".*" },
  tag = "+default-opacity",
})

hl.window_rule({
  name = "fix-xwayland-no-focus",
  match = { class = "^$", title = "^$", xwayland = 1, float = 1, fullscreen = 0, pin = 0 },
  no_focus = true,
})

hl.window_rule({
  name = "waydroid-float",
  match = { class = "Waydroid" },
  float = true,
  size = "540 960",
  center = true,
})

require("apps")

hl.window_rule({
  name = "default-opacity",
  match = { tag = "default-opacity" },
  opacity = "0.97 0.9",
})
