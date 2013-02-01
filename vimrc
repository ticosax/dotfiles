" to bootstrap
" git clone git://github.com/ticosax/dotfiles.git src/dotfiles
" mv .vimrc .vimrc.backup
" ln -s src/dotfiles/vimrc .vimrc
" Run Vi, than type :BundleUpdate
" that's all folks

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
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'indentpython'
Bundle 'vim-flake8'
Bundle 'vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-session'
Bundle 'python.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Rykka/riv.vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/git-log'
Bundle 'vim-scripts/ShowTrailingWhitespace'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

"Globals
set scrolloff=5
set wildignore+=*.pyc

" Powerline
source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/source_plugin.vim
let g:Powerline_cache_enabled = 1
set laststatus=2
set t_Co=16

let g:indentobject_meaningful_indentation = ["python", "markdown", "xml"]

" solarized
syntax enable
set background=dark
colorscheme solarized


"ControlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let ctrlp_by_filename = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_working_path_mode = 'c'


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
"set colorcolumn=80

" sessions
let g:session_autosave = 'yes'
let g:session_default_to_last = 'yes'

" NERDTree
let NERDTreeIgnore = ['\.vim$', '\~$', '\.git$', '\.svn', '\.hg', '\.swp', '\.pyc']
let NERDTreeShowHidden = -1
let NERDTreeChDirMode = 2

" indentation
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4

filetype plugin on

" Declare new style to detect bad space
highlight BadWhitespace ctermbg=white guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

" display when text goes more than 79 chars
highlight OverLength ctermbg=Red guibg=#592929
2match OverLength /\%81v.\+/
highlight ShowTrailingWhitespace ctermbg=White guibg=Red

" XML extensions
au BufNewFile,BufRead *.zcml set filetype=xml

" Taglist
let Tlist_Use_Right_Window = 1

" Riv
let g:riv_fold_auto_update = 0

" spell
au BufRead *.rst setlocal spell

" remapping in NORMAL mode
nmap tlo <Esc>:TlistOpen<CR>
nmap tlt  <Esc>:TlistToggle<CR>
