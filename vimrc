set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-powerline'
Bundle 'colorful256'
Bundle 'ctrlp'
Bundle 'indentpython'
Bundle 'Solarized'
Bundle 'vim-flake8'
Bundle 'vim-powerline'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

let g:Powerline_cache_enabled = 1
set laststatus=2
set t_Co=256

let g:indentobject_meaningful_indentation = ["python", "markdown", "xml"]
colorscheme default

set scrolloff=5

"ControlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
