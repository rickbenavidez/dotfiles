# CachyOS Setup Notes

Setup guide for CachyOS with niri (scrollable tiling Wayland compositor) and Noctalia shell, optimized for a macOS-convert workflow.

## Fresh install steps

### 1. Install CachyOS

Install from USB with the niri/Noctalia desktop option. Use btrfs for the root filesystem (enables snapshots).

### 2. System packages (pacman)

```bash
sudo pacman -S neovim wl-clipboard snapper snap-pac flatpak ufw
```

### 3. Homebrew + starship

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install starship
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install yohasebe/ccusage/ccusage
```

### 4. Fonts

```bash
sudo pacman -S ttf-sourcecodepro-nerd
```

### 5. Flatpak apps

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.google.Chrome us.zoom.Zoom
```

Log out and back in after first flatpak install for XDG portals.

Other apps to install via pacman/flatpak:
- Signal (`flatpak install flathub org.signal.Signal`)
- Slack (`flatpak install flathub com.slack.Slack`)
- Steam (`sudo pacman -S steam`)
- GIMP (`sudo pacman -S gimp`)
- mpv (`sudo pacman -S mpv`)
- Zen Browser (AUR: `paru -S zen-browser-bin`)

### 6. Copy dotfiles

```bash
# Fish shell
cp cachyos/fish/config.fish ~/.config/fish/config.fish

# Starship prompt
cp cachyos/starship.toml ~/.config/starship.toml

# Ghostty terminal
cp cachyos/ghostty.config ~/.config/ghostty/config

# Neovim
mkdir -p ~/.config/nvim
cp cachyos/nvim/init.lua ~/.config/nvim/init.lua

# niri compositor
cp cachyos/niri/config.kdl ~/.config/niri/config.kdl
cp cachyos/niri/cfg/*.kdl ~/.config/niri/cfg/
```

### 7. Snapshots (btrfs)

snapper + snap-pac should auto-create a config during install. Verify:

```bash
sudo snapper list
```

Set retention limits:

```bash
sudo snapper -c root set-config "TIMELINE_CREATE=no" "NUMBER_LIMIT=5" "NUMBER_LIMIT_IMPORTANT=5"
```

### 8. SSH server

```bash
sudo pacman -S openssh
sudo systemctl enable --now sshd
```

Harden — create `/etc/ssh/sshd_config.d/10-hardened.conf`:

```
PermitRootLogin no
PasswordAuthentication no
AuthenticationMethods publickey
```

Then:

```bash
sudo systemctl restart sshd
sudo ufw allow ssh
sudo ufw enable
```

### 9. Claude Code status line

```bash
git clone https://github.com/alexj/oh-my-claude-duo.git ~/.claude/oh-my-claude-duo
```

Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/oh-my-claude-duo/src/statusline.sh",
    "padding": 0
  }
}
```

## System-level tweaks

These require sudo and aren't captured as dotfiles.

### Bluetooth: BlueZ experimental mode

Some Bluetooth earbuds (e.g. Bose QC Ultra) fail A2DP negotiation without this. Symptoms: audio connects in HSP/HFP (mono, 16kHz) instead of A2DP stereo.

In `/etc/bluetooth/main.conf`, set:

```
Experimental = true
```

Then restart the service:

```
sudo systemctl restart bluetooth
```

### Input: macOS-like key layout

The niri input config uses `altwin:swap_alt_win` so the key in the Cmd position acts as Super/Mod — matching macOS muscle memory.

### Trackpad tuning

The niri input config includes:
- `click-method "clickfinger"` — finger count determines button, not tap position
- `dwt` — disable trackpad while typing
- `dwtp` — disable trackpad while using TrackPoint
- `focus-follows-mouse max-scroll-amount="0%"` — prevents viewport scroll from fighting focus

### Audio: PipeWire wedging on resume

If audio stops working (often after sleep), restart PipeWire:

```bash
systemctl --user restart pipewire pipewire-pulse wireplumber
```

## Package management tips

- Prefer official repos (pacman) first, flatpak second, AUR last
- Don't update obsessively — once or twice a week with `paru` is fine
- Never do partial upgrades (`pacman -Sy package`) — always full `pacman -Syu`
- Check pending updates without installing: `checkupdates && paru -Qum`

## Dotfiles in this directory

- `fish/config.fish` — fish shell config (Homebrew, starship init)
- `ghostty.config` — Ghostty terminal (font, theme, keybinds)
- `starship.toml` — Starship prompt (powerline style, CachyOS/Arch icon)
- `niri/` — niri compositor config (keybinds, input, layout, display, etc.)
- `nvim/init.lua` — Neovim clipboard integration
- `keyd-staging/` — keyd config for Mac-style tab switching (not yet installed)
