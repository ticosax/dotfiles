autocmd! bufwritepost ~/.vimrc source %
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
Bundle 'Lokaltog/powerline'
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
Bundle 'klen/python-mode'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/DrawIt'
Bundle 'sjbach/lusty'
Bundle 'plasticboy/vim-markdown'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'saltstack/salt-vim'
Bundle 'wincent/Command-T'
Bundle 'greyblake/vim-preview'
Bundle "ekalinin/Dockerfile.vim"
Bundle "jnwhiteh/vim-golang"
Bundle "elzr/vim-json"

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

" python-mode
" Move this section to ~/src/dotfiles/python_vimrc.vim
let g:pymode_breakpoint = 'disabled'
let g:pymode_run = 0
let g:pymode_lint_ignore = "C0110"
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_completion = 0
let g:pymode_folding = 0
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 0
" let g:pymode_syntax_highlight_self = 1
" let g:pymode_syntax_string_format = 1

" solarized
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")


filetype plugin indent on     " required!

" sessions
" let g:session_autosave = 'yes'
" let g:session_default_to_last = 'yes'

" indentation
" set smartindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set softtabstop=4
set backspace=indent,eol,start

set cursorline

filetype plugin on

au FileType python source ~/src/dotfiles/python_vimrc.vim
au FileType yaml source ~/src/dotfiles/yaml_vimrc.vim
au FileType rst source ~/src/dotfiles/rst_vimrc.vim
au FileType markdown source ~/src/dotfiles/markdown_vimrc.vim

" highlight ShowTrailingWhitespace ctermbg=White guibg=Red

" XML extensions
au BufNewFile,BufRead *.zcml set filetype=xml

" Taglist
let Tlist_Use_Right_Window = 1

" Riv
let g:riv_fold_auto_update = 0

" Yank to system clipboard everytime
set clipboard=unnamedplus

set tags=~/.mytags

" vim-preview
nmap <Leader>pre :Preview<CR>
" remapping in NORMAL mode
nmap <F3> <Esc>:TlistOpen<CR>

noremap <F6> :CommandTFlush<CR>
nnoremap <F4> :set hlsearch!<CR>
