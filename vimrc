autocmd! bufwritepost ~/.vimrc source %

set exrc
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'blueyed/vim-colors-solarized'
Plugin 'powerline/fonts'
Plugin 'Shougo/deoplete.nvim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/git-log'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'saltstack/salt-vim'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'jnwhiteh/vim-golang'
Plugin 'elzr/vim-json'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'blueyed/vim-diminactive'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-sleuth'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mhinz/vim-startify'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'ervandew/supertab'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-eunuch'
Plugin 'chrisbra/SudoEdit.vim'
Plugin 'fisadev/vim-isort'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'benekastah/neomake'

" python
Plugin 'davidhalter/jedi-vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'mkomitee/vim-gf-python'
Plugin 'hynek/vim-python-pep8-indent'


call vundle#end()            " required

let g:session_autosave = 'no'
set backspace=indent,eol,start
"Globals
set scrolloff=5
set wildignore+=*.pyc


let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.5'

" airline
let g:airline_powerline_fonts = 1
set laststatus=2

" let g:indentobject_meaningful_indentation = ["python", "markdown", "xml"]

" solarized
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

au FileType python source ~/src/dotfiles/python_vimrc.vim
au FileType rst source ~/src/dotfiles/rst_vimrc.vim
au FileType markdown source ~/src/dotfiles/markdown_vimrc.vim

filetype plugin indent on     " required!

set cursorline

filetype plugin on
"
" XML extensions
au BufNewFile,BufRead *.zcml set filetype=xml

" Taglist
let Tlist_Use_Right_Window = 1

" Riv
let g:riv_fold_auto_update = 0

" Yank to system clipboard everytime
set clipboard=unnamedplus

set tags=~/.mytags

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set mouse=c

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au VimEnter * DimInactiveToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:startify_custom_header = [
			\ '           yyyyyyyyysoo+++++////+////+//+++++++++ooosssyyyyyy',
			\ '           yyyysss++++////////////://////+///++//++++ossssyyy',
			\ '           yyysoo++//////:://:///:::////+///////////++oossyyh',
			\ '           ssoo+++///:////::/:-://////::--://////////++++osss',
			\ '           so+/////:/::::/:-:/ooossysss+o/:--:////////++o+osy',
			\ '           +//////:::://:.:+ssoso+ssossoss+o/-:///::////++oos',
			\ '           /////::::///:-/+soooss+osoooooosso+-://///////++oo',
			\ '           /////::::::::-+ss+o+oo/osooo+o+oos/:://///////+++o',
			\ '           ///:::::::/::./sso+o+o+ossooooo+os+:-//////////+++',
			\ '           :////:/:::/:--++ooooo+:/++++++ooo+o::/:///:////+++',
			\ '           :/::::::::::-./++so++o/:/:/:/o+o+++--://:/:////++/',
			\ '           ///::::::::::/://ooo+o/:::/:/o+oo+/+/://///////+//',
			\ '           ://::::::::::+++/+oo+o+/////+o+o+++o:://///////+//',
			\ '           /://::::::::::++///+++o+o++++++++//+:///::////++/+',
			\ '           /::/:::/:::::::::+/+//+/+/o+o/++++-:://://///+///+',
			\ '           /::://::::::/:::-++++++++/+o++oo++-:////////////+o',
			\ '           o+::://///::::::-+//+/+++++++o++++-:://:///+///++s',
			\ '           so+:://////:/:::-:oo++++////+++++-:::///////:/+oos',
			\ '           so++//::://:::::..++o///+/+++/++/-:://///////++oos',
			\ '           soo+//::::///:--:+/+s+++///+++oo/+::://:::///++oss',
			\ '           o+//:::----://++++/+soo///+/+oso+++o+++//:---:/++o',
			\ '           /::/:::+o++o++oooo/oo+ooooooooo++oooo+++++////:::/',
			\ '           :/o+oooo+o+++soo+++o/s++++++os++ooo++/+ossooooooo/',
			\ '           osoooooooso//+o+o+ooos+oo+oo+s+o+++++oo+ooooooooos',
			\ '           so/+++/ooo++++/////+++/oo+oo/+++++/oyoooo+ooo+///o',
			\ '',
			\ ]

" deoplete
let g:deoplete#enable_at_startup = 1

" tagbar
nmap <F3> :TagbarToggle<CR>

" NERDTree
nmap <F2> :NERDTreeToggle<CR>

" vim-preview
nmap <Leader>pre :Preview<CR>

noremap <F6> :CommandTFlush<CR>
nnoremap <F4> :set hlsearch!<CR>

" CtrlP
noremap <Leader>fu :CtrlPFunky<CR>
noremap <Leader>t :CtrlP<CR>
noremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
