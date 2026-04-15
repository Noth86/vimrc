#!/usr/bin/env bash
# install.sh — Automated installer for Noth86/vimrc
# Clones to any location; no hardcoded paths required.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIMRC_SRC="$SCRIPT_DIR/vimrc"

echo "==> Installing vimrc from $SCRIPT_DIR"

# ── 1. Install vim-plug ────────────────────────────────────────────────────────
PLUG_FILE="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_FILE" ]; then
    echo "==> Downloading vim-plug..."
    mkdir -p "$(dirname "$PLUG_FILE")"
    curl -fLo "$PLUG_FILE" \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "    vim-plug installed."
else
    echo "    vim-plug already present, skipping."
fi

# ── 2. Back up and symlink vimrc ───────────────────────────────────────────────
# Prefer /etc/vimrc (system-wide) when the user has write access; fall back to ~/.vimrc.
if [ "$EUID" -eq 0 ]; then
    INSTALL_TARGET=/etc/vimrc
else
    INSTALL_TARGET="$HOME/.vimrc"
fi

# Back up an existing plain file (not an existing symlink we already created).
if [ -f "$INSTALL_TARGET" ] && [ ! -L "$INSTALL_TARGET" ]; then
    BACKUP="${INSTALL_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
    echo "==> Backing up $INSTALL_TARGET to $BACKUP"
    mv "$INSTALL_TARGET" "$BACKUP"
fi

if [ ! -L "$INSTALL_TARGET" ] || [ "$(readlink "$INSTALL_TARGET")" != "$VIMRC_SRC" ]; then
    echo "==> Creating symlink $INSTALL_TARGET -> $VIMRC_SRC"
    ln -sf "$VIMRC_SRC" "$INSTALL_TARGET"
else
    echo "    Symlink already correct, skipping."
fi

# ── 3. Install plugins non-interactively ──────────────────────────────────────
echo "==> Installing vim plugins (this may take a moment)..."
vim -es -u "$VIMRC_SRC" -i NONE +PlugInstall +qall
echo "    Plugins installed."

# ── 4. Check optional dependencies ────────────────────────────────────────────
echo ""
echo "==> Checking optional dependencies..."
WARN=0

if ! command -v node &>/dev/null; then
    echo "  [WARN] Node.js not found. Required for jshint.vim JavaScript linting."
    echo "         Install: sudo apt install nodejs  OR  sudo yum install nodejs"
    WARN=1
fi

if ! command -v jshint &>/dev/null; then
    echo "  [WARN] jshint not found. Required for JavaScript linting."
    echo "         Install: sudo npm install -g jshint"
    WARN=1
fi

[ "$WARN" -eq 0 ] && echo "    All optional dependencies found."

# ── 5. Font reminder ──────────────────────────────────────────────────────────
echo ""
echo "==> Font installation (required for Powerline status bar):"
echo "    Font file: $SCRIPT_DIR/Sauce Code Powerline Plus Nerd File Types Plus Pomicons.otf"
echo ""
echo "    macOS   : Double-click the .otf file and click 'Install Font'."
echo "    Linux   : cp \"$SCRIPT_DIR/Sauce Code Powerline Plus Nerd File Types Plus Pomicons.otf\" ~/.fonts"
echo "              fc-cache -f -v"
echo "    Windows : Right-click the .otf file and select 'Install'."
echo ""
echo "==> Done! Launch vim to get started."
