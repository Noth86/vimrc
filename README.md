It will install:
- Vundle
- vim-fugitive
- nerdtree
- lightline
- jsHint
- delimitMate
- ctrlp
- vim-womprat
- robotframework-vim

Instructions:
- Download and install font (Sauce Code Powerline Plus Nerd File Types Plus Pomicons.otf) on your host machine
- Install NodeJs (sudo yum install nodejs)
- Install jsHint (sudo npm install jshint -g) on debian: (sudo ln -s /usr/local/node/node-default/bin/npm /usr/bin/npm && sudo npm install jshint -g)
- git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- git clone git@github.com:Noth86/vimrc.git ~/DotFiles
- sudo mv /etc/vimrc /etc/vimrc.old && sudo ln -s ~/DotFiles/vimrc /etc/vimrc
- Launch vim, skip errors and run :BundleInstall

To use jsHint see these instructions: https://github.com/wookiehangover/jshint.vim

Ready!
