It will install:
- vim-plug (self-bootstrapping plugin manager)
- vim-fugitive
- nerdtree
- lightline
- jsHint
- delimitMate
- ctrlp
- vim-womprat
- robotframework-vim

## Quick install

```bash
git clone git@github.com:Noth86/vimrc.git ~/DotFiles
cd ~/DotFiles
chmod +x install.sh
./install.sh          # installs to ~/.vimrc
sudo ./install.sh     # installs system-wide to /etc/vimrc (requires root)
```

The script will:
1. Download **vim-plug** automatically (no manual Vundle clone needed)
2. Back up any existing `vimrc` / `/etc/vimrc`
3. Create a symlink pointing at this repo's `vimrc`
4. Install all plugins non-interactively
5. Warn if Node.js or jshint are missing

## Font installation

Download and install **Sauce Code Powerline Plus Nerd File Types Plus Pomicons.otf**
(included in this repo) on your host machine:

| OS      | Steps |
|---------|-------|
| **macOS**   | Double-click the `.otf` file → click **Install Font** |
| **Linux**   | `cp "Sauce Code Powerline Plus Nerd File Types Plus Pomicons.otf" ~/.fonts && fc-cache -f -v` |
| **Windows** | Right-click the `.otf` file → **Install** |

### Configure your terminal to use the font

After installing the font you must tell your terminal emulator to use it for
**non-ASCII / fallback characters** so that Powerline glyphs render correctly.

| Terminal | How to set the font |
|----------|---------------------|
| **iTerm2** (macOS) | Preferences → Profiles → Text → **Non-ASCII Font** → select *SauceCodePro Nerd Font* |
| **Terminal.app** (macOS) | Preferences → Profiles → Font → change to *SauceCodePro Nerd Font* |
| **GNOME Terminal** | Edit → Preferences → Profile → Text → uncheck *System font* → select *SauceCodePro Nerd Font* |
| **Konsole** | Settings → Edit Current Profile → Appearance → Font → select *SauceCodePro Nerd Font* |
| **Alacritty** | In `alacritty.yml`: `font: { normal: { family: "SauceCodePro Nerd Font" } }` |
| **kitty** | In `kitty.conf`: `font_family SauceCodePro Nerd Font` |
| **Windows Terminal** | Settings → Profile → Appearance → Font face → *SauceCodePro Nerd Font* |
| **PuTTY / MobaXterm** | Session settings → Window → Appearance → Font → select *SauceCodePro Nerd Font* |

> **Tip:** if the font name doesn't appear in the list, try `SauceCodePro Nerd Font Mono`
> or `Sauce Code Pro for Powerline` depending on which variant your terminal lists.

## Optional: JavaScript linting (jsHint)

Install Node.js and jshint to enable in-editor JS linting:

```bash
# Debian / Ubuntu (for the latest LTS, see https://github.com/nodesource/distributions)
sudo apt install nodejs
sudo npm install -g jshint

# RHEL / CentOS / Fedora
sudo yum install nodejs
sudo npm install -g jshint

# Debian workaround if npm is not in PATH
sudo ln -s /usr/local/node/node-default/bin/npm /usr/bin/npm
sudo npm install -g jshint
```

See also: https://github.com/wookiehangover/jshint.vim

## Ready!
