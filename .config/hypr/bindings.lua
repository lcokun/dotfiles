local browser  = "/usr/bin/zen-browser"
local terminal = [[uwsm app -- kitty --directory="$(terminal-cwd)"]]
local tmux     = [[uwsm-app -- xdg-terminal-exec --dir="$(terminal-cwd)" tmux new]]

hl.bind("SUPER + ALT + Return",   hl.dsp.exec_cmd(tmux),                                { description = "Tmux" })
hl.bind("SUPER + Return",         hl.dsp.exec_cmd(terminal),                            { description = "Terminal" })
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(browser),                             { description = "Browser" })
hl.bind("SUPER + SHIFT + F",      hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"), { description = "File manager" })
hl.bind("SUPER + SHIFT + B",      hl.dsp.exec_cmd(browser),                             { description = "Browser" })
hl.bind("SUPER + SHIFT + ALT + B", hl.dsp.exec_cmd(browser .. " --private"),            { description = "Browser (private)" })
hl.bind("SUPER + SHIFT + M",      hl.dsp.exec_cmd("launch-spotify"),                    { description = "Music" })
hl.bind("SUPER + SHIFT + N",      hl.dsp.exec_cmd("launch-editor"),                     { description = "Editor" })
hl.bind("SUPER + SHIFT + T",      hl.dsp.exec_cmd("launch-btop"),                       { description = "Activity" })
hl.bind("SUPER + SHIFT + D",      hl.dsp.exec_cmd("launch-lazydocker"),                 { description = "Docker" })
hl.bind("SUPER + SHIFT + O",      hl.dsp.exec_cmd("launch-obsidian"),                   { description = "Obsidian" })
hl.bind("SUPER + SHIFT + slash",  hl.dsp.exec_cmd("uwsm app -- 1password"),             { description = "Passwords" })
hl.bind("SUPER + SHIFT + C",      hl.dsp.exec_cmd("/opt/vscodium-bin/bin/codium"),      { description = "VSCodium" })
hl.bind("SUPER + ALT + B",        hl.dsp.exec_cmd("pkill -x waybar; setsid uwsm-app -- waybar"), { description = "Restart Waybar" })
