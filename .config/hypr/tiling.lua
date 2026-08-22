hl.bind("SUPER + W",         hl.dsp.window.close(),                              { description = "Close window" })
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("window-close-all"),              { description = "Close all windows" })
hl.bind("SUPER + J",         hl.dsp.layout("togglesplit"),                       { description = "Toggle window split" })
hl.bind("SUPER + P",         hl.dsp.window.pseudo(),                             { description = "Pseudo window" })
hl.bind("SUPER + T",         hl.dsp.window.float({ action = "toggle" }),         { description = "Toggle window floating/tiling" })
hl.bind("SUPER + F",         hl.dsp.window.fullscreen({ type = 0 }),             { description = "Full screen" })
hl.bind("SUPER + CTRL + F",  hl.dsp.window.fullscreen_state({ client = 0, internal = 2 }), { description = "Tiled full screen" })
hl.bind("SUPER + ALT + F",   hl.dsp.window.fullscreen({ type = 1 }),             { description = "Full width" })
hl.bind("SUPER + O",         hl.dsp.exec_cmd("window-pop"),                      { description = "Pop window out (float & pin)" })
hl.bind("SUPER + L",         hl.dsp.exec_cmd("toggle-workspace-layout"),         { description = "Toggle workspace layout" })

hl.bind("SUPER + LEFT",      hl.dsp.focus({ direction = "left"  }),              { description = "Move window focus left" })
hl.bind("SUPER + RIGHT",     hl.dsp.focus({ direction = "right" }),              { description = "Move window focus right" })
hl.bind("SUPER + UP",        hl.dsp.focus({ direction = "up"    }),              { description = "Move window focus up" })
hl.bind("SUPER + DOWN",      hl.dsp.focus({ direction = "down"  }),              { description = "Move window focus down" })

for i = 1, 10 do
  local code = 9 + i  -- code:10 = 1, code:19 = 0/10
  hl.bind("SUPER + code:" .. code,               hl.dsp.focus({ workspace = i }),                            { description = "Switch to workspace " .. i })
  hl.bind("SUPER + SHIFT + code:" .. code,       hl.dsp.window.move({ workspace = i, follow = true }),       { description = "Move window to workspace " .. i })
  hl.bind("SUPER + SHIFT + ALT + code:" .. code, hl.dsp.window.move({ workspace = i, follow = false }),      { description = "Move window silently to workspace " .. i })
end

hl.bind("SUPER + S",                 hl.dsp.workspace.toggle_special("scratchpad"),                                   { description = "Toggle scratchpad" })
hl.bind("SUPER + ALT + S",           hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }),         { description = "Move window to scratchpad" })

hl.bind("SUPER + TAB",               hl.dsp.focus({ workspace = "e+1" }),                                              { description = "Next workspace" })
hl.bind("SUPER + SHIFT + TAB",       hl.dsp.focus({ workspace = "e-1" }),                                              { description = "Previous workspace" })
hl.bind("SUPER + CTRL + TAB",        hl.dsp.focus({ workspace = "previous" }),                                         { description = "Former workspace" })
hl.bind("CTRL + ALT + TAB",          hl.dsp.focus({ monitor = "+1" }),                                                 { description = "Focus next monitor" })
hl.bind("CTRL + ALT + SHIFT + TAB",  hl.dsp.focus({ monitor = "-1" }),                                                 { description = "Focus previous monitor" })

hl.bind("SUPER + SHIFT + ALT + LEFT",  hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind("SUPER + SHIFT + ALT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })
hl.bind("SUPER + SHIFT + ALT + UP",    hl.dsp.workspace.move({ monitor = "u" }), { description = "Move workspace to up monitor" })
hl.bind("SUPER + SHIFT + ALT + DOWN",  hl.dsp.workspace.move({ monitor = "d" }), { description = "Move workspace to down monitor" })

hl.bind("SUPER + SHIFT + LEFT",  hl.dsp.window.swap({ direction = "left"  }), { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + UP",    hl.dsp.window.swap({ direction = "up"    }), { description = "Swap window up" })
hl.bind("SUPER + SHIFT + DOWN",  hl.dsp.window.swap({ direction = "down"  }), { description = "Swap window down" })

hl.bind("ALT + TAB",         hl.dsp.window.cycle_next(),                 { description = "Cycle to next window" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ prev = true }),  { description = "Cycle to prev window" })
hl.bind("ALT + TAB",         hl.dsp.window.bring_to_top(),               { description = "Reveal active window on top" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.bring_to_top(),               { description = "Reveal active window on top" })

hl.bind("SUPER + code:20",         hl.dsp.window.resize({ x = -100, y = 0,    relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21",         hl.dsp.window.resize({ x =  100, y = 0,    relative = true }), { description = "Shrink window left" })
hl.bind("SUPER + SHIFT + code:20", hl.dsp.window.resize({ x = 0,    y = -100, relative = true }), { description = "Shrink window up" })
hl.bind("SUPER + SHIFT + code:21", hl.dsp.window.resize({ x = 0,    y =  100, relative = true }), { description = "Expand window down" })

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

hl.bind("SUPER + G",        hl.dsp.group.toggle(),                  { description = "Toggle window grouping" })
hl.bind("SUPER + ALT + G",  hl.dsp.window.move({ out_of_group = true }), { description = "Move active window out of group" })

hl.bind("SUPER + ALT + LEFT",  hl.dsp.window.move({ into_group = "l" }), { description = "Move window to group on left" })
hl.bind("SUPER + ALT + RIGHT", hl.dsp.window.move({ into_group = "r" }), { description = "Move window to group on right" })
hl.bind("SUPER + ALT + UP",    hl.dsp.window.move({ into_group = "u" }), { description = "Move window to group on top" })
hl.bind("SUPER + ALT + DOWN",  hl.dsp.window.move({ into_group = "d" }), { description = "Move window to group on bottom" })

hl.bind("SUPER + ALT + TAB",         hl.dsp.group.next(), { description = "Next window in group" })
hl.bind("SUPER + ALT + SHIFT + TAB", hl.dsp.group.prev(), { description = "Previous window in group" })

hl.bind("SUPER + CTRL + LEFT",  hl.dsp.group.prev(), { description = "Move grouped window focus left" })
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.group.next(), { description = "Move grouped window focus right" })

hl.bind("SUPER + ALT + mouse_down", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind("SUPER + ALT + mouse_up",   hl.dsp.group.prev(), { description = "Previous window in group" })

for i = 1, 5 do
  hl.bind("SUPER + ALT + code:" .. (9 + i), hl.dsp.group.active({ index = i }), { description = "Switch to group window " .. i })
end

hl.bind("SUPER + Slash", hl.dsp.exec_cmd("cycle-display-scale"), { description = "Cycle monitor scaling" })
