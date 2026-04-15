set list
set nowrap
set nocompatible              " be iMproved

" vim-plug: auto-install if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'wookiehangover/jshint.vim'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'prettier/prettier'
Plug 'beyondwords/vim-twig'
Plug 'mfukar/robotframework-vim'

" Theme
Plug 'jtai/vim-womprat'

call plug#end()

" Active plugin
filetype plugin indent on

" JSHint configuration
let JSHintUpdateWriteOnly=1
let g:JSHintHighlightErrorLine = 0

" NERDTree configuration
let g:NERDTreeDirArrows=0
autocmd vimenter * if !argc() | NERDTree | endif

" General
syntax on
set wmh=0 " set minum windows height to 0
set number
set noswapfile
set smartindent
set autoindent
set expandtab
set cursorline
set cursorcolumn
set hlsearch " Highlight search terms...
set tabstop=4
set laststatus=2
set shiftwidth=4
set backspace=2
colorscheme womprat
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" Powerline configuration
set encoding=utf-8
set t_Co=255

" Force syntax higlighting
au BufRead,BufNewFile *.js.yug setfiletype javascript
au BufRead,BufNewFile *.*.js.yug setfiletype javascript

au BufRead,BufNewFile *.css.yug setfiletype css
au BufRead,BufNewFile *.*.css.yug setfiletype css
au BufRead,BufNewFile *.scss set syntax=css

au BufNewFile,BufRead *.yaml,*.yml execute 'source ' . expand('<sfile>:p:h') . '/syntax/yaml.vim'

" Lightline configuration
let g:lightline = {
    \    "colorscheme": "landscape",
    \    "mode_map": { "c": "NORMAL" },
    \    "active": {
    \        "left": [ [ "mode", "paste" ], [ "fugitive", "filename" ] ]
    \    },
    \    "component_function": {
    \        "modified": "MyModified",
    \        "readonly": "MyReadonly",
    \        "fugitive": "MyFugitive",
    \        "filename": "MyFilename",
    \        "fileformat": "MyFileformat",
    \        "filetype": "MyFiletype",
    \        "fileencoding": "MyFileencoding",
    \        "mode": "MyMode",
    \    },
    \    "separator": { "left": "\ue0b0", "right": "\ue0b2" },
    \    "subseparator": { "left": "\ue0b1", "right": "\ue0b3" }
    \ }

function! MyModified()
    return &ft =~ "help\|vimfiler\|gundo" ? "" : &modified ? "+" : &modifiable ? "" : "-"
endfunction

function! MyReadonly()
    return &ft !~? "help\|vimfiler\|gundo" && &readonly ? "\ue0a2" : ""
endfunction

function! MyFilename()
    let fname = expand("%:t")
    return fname == "__Tagbar__" ? g:lightline.fname :
        \ fname =~ "__Gundo\|NERD_tree" ? "" :
        \ &ft == "vimfiler" ? vimfiler#get_status_string() :
        \ &ft == "unite" ? unite#get_status_string() :
        \ &ft == "vimshell" ? vimshell#get_status_string() :
        \ ("" != MyReadonly() ? MyReadonly() . " " : "") .
        \ ("" != fname ? fname : "[No Name]") .
        \ ("" != MyModified() ? " " . MyModified() : "")
endfunction

function! MyFugitive()
    try
        if expand("%:t") !~? "Tagbar\|Gundo\|NERD" && &ft !~? "vimfiler" && exists("*fugitive#head")
            let mark = ""  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? "\ue0a0 " . _ : "\ue0a0 no-branch"
        endif
    catch
    endtry
    return ""
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ""
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : "no ft") : ""
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ""
endfunction

function! MyMode()
    let fname = expand("%:t")
    return fname == "__Tagbar__" ? "Tagbar" :
        \ fname == "ControlP" ? "CtrlP" :
        \ fname == "__Gundo__" ? "Gundo" :
        \ fname == "__Gundo_Preview__" ? "Gundo Preview" :
        \ fname =~ "NERD_tree" ? "NERDTree" :
        \ &ft == "unite" ? "Unite" :
        \ &ft == "vimfiler" ? "VimFiler" :
        \ &ft == "vimshell" ? "VimShell" :
        \ winwidth(0) > 60 ? lightline#mode() : ""
endfunction
