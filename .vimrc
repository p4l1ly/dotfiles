set encoding=utf-8
let g:haskell_conceal=0

set nocompatible
set backspace=indent,eol,start " backspace through anything

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch            " highlight the last search pattern
set number              " show line numbers
set nowrap              " no linewrapping

set dir=~/.backup

if has('mouse')
  set mouse=a
endif

execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent off

set wildmode=list:longest "bash-like navigation

" indentation
set autoindent      " indent new line with same indent as the previous one
set nocindent       " don't try to indent c-like files
set nosmartindent   " and don't think you're smarter than me
set shiftwidth=2    " shift text by 2 columns
set tabstop=8       " <Tab> in file is shown as 8 spaces
set softtabstop=2   " move two columns to right when pushing <Tab>
set noshiftround    " round indent to multiple of shiftwidth
set expandtab       " when using <Tab>, insert spaces instead
set colorcolumn=81
set textwidth=80

nmap []p o<Space><BS><ESC>p
nmap []P O<Space><BS><ESC>p
command! -range=% Tcss <line1>,<line2>Tab /^[^:]*:/l0l1
command! -range=% Tdm <line1>,<line2>Tab/^\s\+property\s:\w\+,
map Y y$

colorscheme dark

"F10 shows highlighting style under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" .  synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
