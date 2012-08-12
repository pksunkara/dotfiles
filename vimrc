" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" This is the personal .vimrc file of Pavan Kumar Sunkara
" }

" Environment {
    " Basic {
        set nocompatible
        set t_Co=16
        set background=dark
    " }

    " Pathogen {
        call pathogen#infect()
        call pathogen#helptags()
    " }
" }

" General {
    syntax on
    filetype plugin indent on
    set encoding=utf-8
" }

" Vim UI {
    set tabpagemax=15
    set showmode
    set cursorline
    set laststatus=2
    set number
    set showmatch
    set ignorecase
    set smartcase
    set list
    set listchars=extends:»,precedes:«,tab:›\ ,trail:‹
    set wildignore=*.class,*.o,*~,*.pyc,.git,third_party,node_modules
" }

" Formatting {
    set nowrap
    set autoindent
    set shiftwidth=4
    set expandtab
    set tabstop=4
    set softtabstop=4
    set pastetoggle=<F12>
" }

" Key Mappings {
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>
    map <C-K> <C-W>k<C-W>
    map <C-L> <C-W>l<C-W>
    map <C-H> <C-W>h<C-W>

    nnoremap Y y$
" }

" Plugins {
    " SnipMate {
        let g:snips_author = 'Pavan Kumar Sunkara <pavan.sss1991@gmail.com>'
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.sw*$', '\.git', '\.hg', '\.svn']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

    " Tagbar {
        nnoremap <silent> <leader>l :TagbarToggle<CR>
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }

    " MiniBufExpl {
        nnoremap <silent> <leader>m :TMiniBufExplorer<CR>
        nnoremap <silent> <leader>mu :UMiniBufExplorer<CR>

        let g:miniBufExplMapWindowNavArrows=1
    " }
" }

" Highight {
    " Diff {
        highlight DiffAdd term=reverse cterm=bold ctermbg=black ctermfg=green
        highlight DiffChange term=reverse cterm=bold ctermbg=black ctermfg=cyan
        highlight DiffText term=reverse cterm=bold ctermbg=black ctermfg=yellow
        highlight DiffDelete term=reverse cterm=bold ctermbg=black ctermfg=red
    " }
" }
