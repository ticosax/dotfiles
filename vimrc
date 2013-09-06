autocmd! bufwritepost .vimrc source %
" to bootstrap
" git clone git://github.com/ticosax/dotfiles.git src/dotfiles
" mv .vimrc .vimrc.backup
" ln -s src/dotfiles/vimrc .vimrc
" Run Vi, than type :BundleUpdate
" that's all folks

set nocompatible               " be iMproved
filetype off                   " required!
set copyindent
set number
set shiftround
set showmatch
set smartcase
set hlsearch
set nobackup
set noswapfile
set hidden

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
" Bundle 'indentpython'
Bundle 'vim-flake8'
Bundle 'scrooloose/nerdtree'
" Bundle 'xolox/vim-session'
" Bundle 'python.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Rykka/riv.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'amitdev/vimpy'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/git-log'
" Bundle 'vim-scripts/ShowTrailingWhitespace'
Bundle 'vim-scripts/pythonhelper'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'sjbach/lusty'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

let g:session_autosave = 'no'
"Globals
set scrolloff=5
set wildignore+=*.pyc

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

let g:Powerline_cache_enabled = 1
set laststatus=2
set t_Co=16
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" let g:indentobject_meaningful_indentation = ["python", "markdown", "xml"]

" solarized
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")


"ControlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let ctrlp_by_filename = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_working_path_mode = 'c'

filetype plugin indent on     " required!

" sessions
" let g:session_autosave = 'yes'
" let g:session_default_to_last = 'yes'

" NERDTree
let NERDTreeIgnore = ['\.vim$', '\~$', '\.git$', '\.svn', '\.hg', '\.swp', '\.pyc']
let NERDTreeShowHidden = -1
let NERDTreeChDirMode = 2

" indentation
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set backspace=indent,eol,start
set cursorline

filetype plugin on

au FileType python source ~/src/dotfiles/python_vimrc.vim

" highlight ShowTrailingWhitespace ctermbg=White guibg=Red


" XML extensions
au BufNewFile,BufRead *.zcml set filetype=xml

" Taglist
let Tlist_Use_Right_Window = 1

" Riv
let g:riv_fold_auto_update = 0

" spell
au BufRead *.rst setlocal spell

" Yank to system clipboard everytime
set clipboard=unnamedplus

" remapping in NORMAL mode
nmap <F3> <Esc>:TlistOpen<CR>

noremap <F6> :CommandTFlush<CR>

set tags=~/mytags
