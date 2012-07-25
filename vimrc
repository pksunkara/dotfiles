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
set listchars=extends:»,precedes:«,tab:›\ ,trail:‹
set list
set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules

highlight DiffAdd term=reverse cterm=bold ctermbg=black ctermfg=green
highlight DiffChange term=reverse cterm=bold ctermbg=black ctermfg=cyan
highlight DiffText term=reverse cterm=bold ctermbg=black ctermfg=yellow
highlight DiffDelete term=reverse cterm=bold ctermbg=black ctermfg=red
