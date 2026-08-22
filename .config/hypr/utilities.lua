hl.bind("SUPER + SPACE",            hl.dsp.exec_cmd("walker"),                   { description = "Launch apps" })
hl.bind("SUPER + CTRL + E",         hl.dsp.exec_cmd("walker -m symbols"),        { description = "Emoji picker" })
hl.bind("SUPER + CTRL + C",         hl.dsp.exec_cmd("app-menu capture"),         { description = "Capture menu" })
hl.bind("SUPER + CTRL + O",         hl.dsp.exec_cmd("app-menu toggle"),          { description = "Toggle menu" })
hl.bind("SUPER + ALT + SPACE",      hl.dsp.exec_cmd("app-menu"),                 { description = "App menu" })
hl.bind("SUPER + SHIFT + F23",      hl.dsp.exec_cmd("app-menu"),                 { description = "App menu (Copilot key)" })
hl.bind("SUPER + Escape",           hl.dsp.exec_cmd("app-menu system"),          { description = "System menu" })
hl.bind("XF86PowerOff",             hl.dsp.exec_cmd("app-menu system"),          { locked = true, description = "Power menu" })
hl.bind("SUPER + K",                hl.dsp.exec_cmd("keybindings-viewer"),       { description = "Show key bindings" })
hl.bind("XF86Calculator",           hl.dsp.exec_cmd("gnome-calculator"),         { description = "Calculator" })
hl.bind("SUPER + SHIFT + SPACE",    hl.dsp.exec_cmd("pkill -x waybar || uwsm-app -- waybar"), { description = "Toggle top bar" })

hl.bind("SUPER + BackSpace",        hl.dsp.exec_cmd([[hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle]]), { description = "Toggle window transparency" })
hl.bind("SUPER + SHIFT + BackSpace", hl.dsp.exec_cmd("toggle-gaps"),             { description = "Toggle window gaps" })
hl.bind("SUPER + CTRL + BackSpace", hl.dsp.exec_cmd("toggle-window-aspect"),     { description = "Toggle single-window square aspect" })

hl.bind("SUPER + comma",            hl.dsp.exec_cmd("makoctl dismiss"),          { description = "Dismiss last notification" })
hl.bind("SUPER + SHIFT + comma",    hl.dsp.exec_cmd("makoctl dismiss --all"),    { description = "Dismiss all notifications" })
hl.bind("SUPER + CTRL + comma",     hl.dsp.exec_cmd("toggle-notifications"),     { description = "Toggle silencing notifications" })
hl.bind("SUPER + ALT + comma",      hl.dsp.exec_cmd("makoctl invoke"),           { description = "Invoke last notification" })
hl.bind("SUPER + SHIFT + ALT + comma", hl.dsp.exec_cmd("makoctl restore"),       { description = "Restore last notification" })

hl.bind("SUPER + CTRL + I",         hl.dsp.exec_cmd("toggle-idle"),              { description = "Toggle locking on idle" })
hl.bind("SUPER + CTRL + N",         hl.dsp.exec_cmd("toggle-nightlight"),        { description = "Toggle nightlight" })

hl.bind("Print",                    hl.dsp.exec_cmd("screenshot"),               { description = "Screenshot" })
hl.bind("ALT + Print",              hl.dsp.exec_cmd("app-menu screenrecord"),    { description = "Screenrecord menu" })
hl.bind("SUPER + Print",            hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })
hl.bind("SUPER + CTRL + Print",     hl.dsp.exec_cmd("capture-text"),             { description = "Extract text (OCR)" })

hl.bind("SUPER + CTRL + S",         hl.dsp.exec_cmd("app-menu share"),           { description = "Share" })
hl.bind("SUPER + CTRL + ALT + T",   hl.dsp.exec_cmd([[notify-send "    $(date +"%A %H:%M  —  %d %B W%V %Y")"]]), { description = "Show time" })
hl.bind("SUPER + CTRL + ALT + B",   hl.dsp.exec_cmd("battery-status"),           { description = "Show battery" })

hl.bind("SUPER + CTRL + A",         hl.dsp.exec_cmd("launch-audio"),             { description = "Audio controls" })
hl.bind("SUPER + CTRL + B",         hl.dsp.exec_cmd("launch-bluetooth"),         { description = "Bluetooth controls" })
hl.bind("SUPER + CTRL + W",         hl.dsp.exec_cmd("launch-wifi"),              { description = "Wifi controls" })
hl.bind("SUPER + CTRL + T",         hl.dsp.exec_cmd("launch-btop"),              { description = "Activity" })

hl.bind("SUPER + CTRL + Z",         hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')]]), { description = "Zoom in" })
hl.bind("SUPER + CTRL + ALT + Z",   hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"), { description = "Reset zoom" })

hl.bind("SUPER + CTRL + L",         hl.dsp.exec_cmd("lock-screen"),              { description = "Lock system" })
