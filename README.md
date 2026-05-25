# dotfiles

Personal dotfiles for my Arch Linux + Hyprland setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## System

| | |
|---|---|
| OS | Arch Linux ([Omarchy](https://github.com/basecamp/omarchy) base, heavily customized) |
| WM | Hyprland 0.54+ |
| Shell | fish |
| Terminal | Kitty |
| Bar | Waybar |
| Launcher | Walker |
| Prompt | Starship (pastel-powerline) |
| Display | 2560x1600 @ 240Hz (eDP-1) + 1920x1080 @ 120Hz (HDMI) |
| GPU | NVIDIA RTX 4070 Mobile |

## Structure

```
dotfiles/
├── .config/
│   ├── fastfetch/       # Fastfetch system info config
│   ├── fish/            # Fish shell config and functions
│   ├── hypr/            # Hyprland WM configs (split by concern)
│   │   ├── hyprland.lua     # Entry point (0.55+ Lua config)
│   │   ├── hyprland.conf    # Entry point (legacy, 0.54 and below)
│   │   ├── apps.lua/conf    # Per-app window rules
│   │   ├── autostart.lua/conf   # Autostart services
│   │   ├── bindings.lua/conf    # Application keybindings
│   │   ├── clipboard.lua/conf   # Clipboard manager bindings
│   │   ├── colors.lua       # Color variables (Lua only)
│   │   ├── envs.lua/conf    # Environment variables
│   │   ├── input.lua/conf   # Keyboard/mouse/touchpad
│   │   ├── looknfeel.lua/conf   # Visuals, animations, blur
│   │   ├── media.lua/conf   # Media key bindings
│   │   ├── monitors.lua/conf    # Monitor layout
│   │   ├── tiling.lua/conf  # Tiling/layout bindings
│   │   ├── utilities.lua/conf   # Utility keybindings
│   │   ├── windows.lua/conf # Global window rules
│   │   └── xdph.conf        # xdg-desktop-portal-hyprland settings
│   ├── starship/        # Starship prompt config
│   ├── uwsm/            # UWSM session manager (env, defaults)
│   ├── walker/          # Walker app launcher config
│   └── waybar/          # Waybar status bar config and styles
└── .local/
    └── bin/             # ~50 custom scripts
```

Each config area has a `.lua` file (active on Hyprland 0.55+) and a `.conf` file (active on 0.54 and below). On 0.55+, `hyprland.lua` takes priority and the `.conf` files are ignored.

## Scripts (`~/.local/bin/`)

### App launchers
| Script | Purpose |
|---|---|
| `launch-audio` | Wiremix audio mixer (floating terminal) |
| `launch-bluetooth` | bluetui Bluetooth manager |
| `launch-btop` | btop resource monitor |
| `launch-editor` | micro text editor |
| `launch-lazydocker` | lazydocker container manager |
| `launch-obsidian` | Obsidian notes |
| `launch-spotify` | Spotify |
| `launch-wifi` | impala WiFi manager |

### System controls
| Script | Purpose |
|---|---|
| `app-menu` | Central menu system (Learn, Trigger, Update, System) |
| `brightness-display` | Display brightness via `brightnessctl` |
| `brightness-keyboard` | Keyboard backlight brightness |
| `brightness-osd` | Display brightness with OSD feedback |
| `kbd-brightness-osd` | Keyboard brightness with OSD feedback |
| `audio-switch` | Cycle audio output devices |
| `battery-status` | Battery notification (%, rate, time remaining) |
| `battery-monitor` | Background battery level notifier |
| `capture-text` | OCR text capture — select area, copy text to clipboard |
| `lock-screen` | Lock screen via hyprlock |
| `power-profile-menu` | Switch power profiles via Walker |
| `screenshot` | Screenshot tool |
| `screenrecord` | Screen recording |
| `screenrecord-status` | Check if recording is active |
| `share` | File sharing menu |
| `system-update` | System update (pacman + paru AUR + orphan cleanup) |
| `terminal-cwd` | Get CWD of focused terminal (for new window spawning) |

### Toggles
| Script | Purpose |
|---|---|
| `toggle-gaps` | Toggle window gaps on/off |
| `toggle-idle` | Toggle idle/screensaver lock |
| `toggle-nightlight` | Toggle hyprsunset night colour temperature |
| `toggle-notifications` | Toggle mako notification silencing |
| `toggle-window-aspect` | Toggle single-window square aspect ratio |
| `toggle-workspace-layout` | Toggle dwindle/master layout |

### Window management
| Script | Purpose |
|---|---|
| `cycle-display-scale` | Cycle monitor scale factors |
| `restore-hypr-toggles` | Restore toggle states (gaps, aspect ratio) on session start |
| `window-close-all` | Close all windows on current workspace |
| `window-pop` | Pop focused window to/from scratchpad |

### Status indicators (used by Waybar)
| Script | Purpose |
|---|---|
| `idle-status` | Output idle inhibit state for Waybar |
| `notification-status` | Output notification silence state for Waybar |
| `dot-status` | DoT (DNS-over-TLS) status indicator |
| `dot-toggle` | Toggle DNS-over-TLS strict/opportunistic |

### Theming
| Script | Purpose |
|---|---|
| `matugen-theme` | Apply a matugen dynamic theme from image or color |
| `matugen-next` | Cycle to next wallpaper and regenerate palette |

### Other
| Script | Purpose |
|---|---|
| `keybindings-viewer` | Browse all Hyprland keybindings in Walker |
| `lutris` | Python shim for Lutris (launch fix) |
| `manga` | Mirror Android phone screen via scrcpy over SSH |
| `screensaver` | Screensaver runner |
| `launch-screensaver` | Launch screensaver window |
| `restart-walker` | Restart Walker launcher |
| `virt-manager` | Python shim for virt-manager (launch fix) |

## Setup

### Requirements

```bash
paru -S hyprland waybar walker ghostty fish starship stow \
        mako hypridle hyprlock hyprsunset swayosd swaybg \
        brightnessctl matugen
```

### Install

```bash
git clone git@github.com:lcokun/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --adopt -t ~ .
```

`--adopt` moves any existing files at the target locations into the repo (making the repo authoritative) and creates symlinks. If you want a preview first without making changes:

```bash
stow --simulate -t ~ .
```

### Adding new files

To track a new config file:

```bash
# Copy it into the repo at the correct path
cp ~/.config/foo/bar.conf ~/dotfiles/.config/foo/bar.conf

# Re-run stow to create the symlink
cd ~/dotfiles && stow --adopt -t ~ .

# Commit
git add .config/foo/bar.conf && git commit -m "add foo config"
```

Since the live file is now a symlink to the repo, any future edits to `~/.config/foo/bar.conf` are automatically reflected in the repo — just `git add` and commit when ready.

### Removing files from stow management

```bash
cd ~/dotfiles
stow -D -t ~ .          # Remove all symlinks
# or selectively delete the file from the repo and re-stow
```

## Theming

Dynamic theming via [matugen](https://github.com/InioX/matugen) — generates a full palette from a wallpaper image or hex color and applies it across all apps.

Switch themes:
```bash
matugen-theme image ~/Pictures/walls/dark/001.jpg
matugen-theme color "#8673d4"
matugen-next   # cycle wallpapers and regenerate palette
```

Static themes (NieR: Automata, synthwave, etc.) live in `~/.config/omarchy/themes/<name>/`.

## Notes

- `~/.config/hypr/shaders/` is not tracked — shaders are symlinks to `/usr/share/aether/shaders/` (system-managed)
- `~/.config/mako/config` is not tracked — it's a symlink to the active theme
- `~/.config/alacritty/` and `~/.config/ghostty/` are not tracked — Kitty is the primary terminal
- Binaries (`uv`, `uvx`, `claude`, `python3.13`) are gitignored even if present in `~/.local/bin/`
