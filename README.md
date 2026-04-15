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
