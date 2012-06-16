set nocompatible

call pathogen#infect()
call pathogen#helptags()

syntax enable

filetype plugin indent on

set t_Co=16
set background=dark
let g:solarized_termcolors=16

"colorscheme solarized

set laststatus=2
set encoding=utf-8
set number
set listchars=extends:»,precedes:«,tab:›\ ,trail:‹,eol:·
set list
set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules
