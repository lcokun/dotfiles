-- Border colors come from matugen's dynamic theme.
-- matugen regenerates ~/.config/omarchy/current/theme/hyprland.conf (hyprlang)
-- on every `matugen-next` / `matugen-theme` run. The old hyprland.conf sourced
-- that file directly; Hyprland's Lua config has no `source` equivalent, so we
-- parse the two border colors out of it here and apply them via hl.config.
-- This keeps matugen working untouched -- the colors refresh on the next
-- Hyprland reload, exactly like the old `source =` behaviour.

local theme_conf = os.getenv("HOME") .. "/.config/omarchy/current/theme/hyprland.conf"

-- Fallback snapshot, used only if the theme file is missing/unreadable.
local active_border   = "rgb(d4bbfc)"
local inactive_border = "rgb(151218)"

local f = io.open(theme_conf, "r")
if f then
  for line in f:lines() do
    local active = line:match("col%.active_border%s*=%s*(.+)")
    if active then
      active_border = active:gsub("%s*#.*$", ""):gsub("%s+$", "")
    end
    local inactive = line:match("col%.inactive_border%s*=%s*(.+)")
    if inactive then
      inactive_border = inactive:gsub("%s*#.*$", ""):gsub("%s+$", "")
    end
  end
  f:close()
end

hl.config({
  general = {
    ["col.active_border"]   = active_border,
    ["col.inactive_border"] = inactive_border,
  },
})
