" This configuration file was tested with
"       /usr/local/bin/vim (7.0) and
"       /usr/local/bin/gvim (7.0)
"this line prevents copydotfiles from recopying: dot-vimrc_included
execute pathogen#infect()

nnoremap § :NERDTreeToggle<CR>

syntax on
set term=xterm
set et
set ai
set cin
set ru
set bs=indent,eol,start
set sw=4  "this is the level of autoindent, adjust to taste
colorscheme desert

set ff=unix

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set colorcolumn=90
highlight ColorColumn ctermbg=7 guibg=lightgrey
set expandtab
set paste
set hlsearch

autocmd BufWritePre * :%s/\s\+$//e
