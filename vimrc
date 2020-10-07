autocmd! bufwritepost ~/.config/nvim/init.vim source %
autocmd! bufwritepost ~/src/dotfiles/vimrc source %

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
set relativenumber

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" for euclio/vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
"Plug 'iCyMind/NeoSolarized'
Plug 'blueyed/vim-qf_resize'
Plug 'romainl/vim-qf'
Plug 'powerline/fonts'
Plug 'junegunn/fzf'
Plug 'ncm2/ncm2'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-highprio-pop'
Plug 'ncm2/ncm2-markdown-subscope'

Plug 'roxma/nvim-yarp'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/git-log'
Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}
Plug 'terryma/vim-multiple-cursors'
Plug 'saltstack/salt-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-sleuth'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-eunuch'
Plug 'chrisbra/SudoEdit.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hashivim/vim-vagrant'
Plug 'andrewstuart/vim-kubernetes'
Plug 'jamessan/vim-gnupg'
Plug 'sbdchd/neoformat'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'psliwka/vim-smoothie'
Plug 'wadackel/vim-dogrun'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ncm2/ncm2-github'
Plug 'lambdalisue/gina.vim'
Plug 'rbong/vim-flog'

" toml
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'

" python
" Plug 'davidhalter/jedi-vim'
Plug 'alfredodeza/pytest.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'plytophogy/vim-virtualenv'
Plug 'stsewd/isort.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'raimon49/requirements.txt.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" scala
Plug 'derekwyatt/vim-scala'

" rst
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'racer-rust/vim-racer'

" JS
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

call plug#end()

let g:session_autosave = 'no'
set backspace=indent,eol,start
"Globals
set scrolloff=5
set wildignore+=*.pyc


" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" let g:python_host_prog = '/home/nicolas/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/home/nicolas/.pyenv/versions/neovim3/bin/python'

" airline
let g:airline_powerline_fonts = 1
let g:airline_extensions_add = ['neomake']
let g:airline_theme = 'solarized'

set laststatus=2
" let g:indentobject_meaningful_indentation = ["python", "markdown", "xml"]

" solarized
syntax enable
set background=dark
let g:neosolarized_vertSplitBgTrans = 1
colorscheme dogrun
" comes with dogrun
hi Search ctermfg=7

let g:gitgutter_override_sign_column_highlight = 0

au FileType python source ~/src/dotfiles/python_vimrc.vim
au FileType rst source ~/src/dotfiles/rst_vimrc.vim
au FileType markdown source ~/src/dotfiles/markdown_vimrc.vim
au FileType yaml source ~/src/dotfiles/yaml_vimrc.vim
au FileType rust source ~/src/dotfiles/rust_vimrc.vim

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
" au VimEnter * DimInactiveToggle
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

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" tagbar
nmap <F3> :TagbarToggle<CR>

" set inccommand=split
" NERDTree
nmap <F2> :NERDTreeToggle<CR>

" vim-preview
nmap <Leader>pre :Preview<CR>

noremap <F6> :CommandTFlush<CR>
nnoremap <F4> :set hlsearch!<CR>

" WhiteSpace
autocmd BufWritePre * ToggleStripWhitespaceOnSave

" CtrlP
noremap <Leader>fu :CtrlPFunky<CR>
noremap <Leader>t :CtrlP<CR>
noremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox|ropeproject|tmp)$'

" move cursor at end of selection once yanked
vmap y ygv<ESC>

" lsp
"
" \ 'python': ['/home/nicolas/.pyenv/shims/pyls'],
" "\ 'python': ['/home/nicolas/.cache/pypoetry/virtualenvs/kompost-py3.7/bin/pyls'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['yarn', 'run', 'typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['yarn', 'run', 'typescript-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ 'go': ['~/go/bin/go-langserver'],
    \ 'tf': ['~/src/terraform-lsp/terraform-lsp'],
    \ }
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent>FF <Plug>(lcn-format)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-references)
nmap <silent> gi <Plug>(lcn-implementation)
nmap <silent> <F2> <Plug>(lcn-rename)

" ncm2/ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
" set shortmess+=c
"
" " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>
"
" " When the <Enter> key is pressed while the popup menu is visible, it only
" " hides the menu. Use this mapping to close the menu and also start a new
" " line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"
" " Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
