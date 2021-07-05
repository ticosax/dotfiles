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
Plug 'tomtom/tcomment_vim'
Plug 'blueyed/vim-qf_resize'
Plug 'romainl/vim-qf'
Plug 'powerline/fonts'
" Plug 'junegunn/fzf'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" Completion
Plug 'hrsh7th/nvim-compe'
" Plug 'ncm2/ncm2'
" " NOTE: you need to install completion sources to get completions. Check
" " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-racer'
" Plug 'ncm2/ncm2-match-highlight'
" Plug 'ncm2/ncm2-highprio-pop'
" Plug 'ncm2/ncm2-markdown-subscope'
" Plug 'subnut/ncm2-github-emoji'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-gtags'
" " useful for above plugin :arrow-up:
" Plug 'jsfaint/gen_tags.vim'
" Plug 'ncm2/ncm2-neoinclude'
" Plug 'Shougo/neoinclude.vim'
" Plug 'fgrsnau/ncm2-aspell'
" Plug 'fgrsnau/ncm2-otherbuf'
" Plug 'TyberiusPrime/ncm2-bufline'

Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'saltstack/salt-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'tommcdo/vim-exchange'
Plug 'inkarkat/argtextobj.vim'
Plug 'tpope/vim-sleuth'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-eunuch'
Plug 'chrisbra/SudoEdit.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hashivim/vim-vagrant'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'psliwka/vim-smoothie'
Plug 'tyru/caw.vim'
Plug 'kana/vim-repeat'
Plug 'glepnir/indent-guides.nvim', {'branch': 'main'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Files
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" tablines
" Plug 'bagrat/vim-buffet'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
" Plug 'liuchengxu/eleline.vim'
Plug 'itchyny/lightline.vim'

" colorschemes
Plug 'wadackel/vim-dogrun'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'mhartington/oceanic-next'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

" Emojis support
Plug 'ryanoasis/vim-devicons'
Plug 'adelarsq/vim-devicons-emoji'

" https://www.chrisatmachine.com/Neovim/12-git-integration/
"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ncm2/ncm2-github'
Plug 'lambdalisue/gina.vim'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
" neovim 5
Plug 'f-person/git-blame.nvim'

" toml
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'

" python
Plug 'hynek/vim-python-pep8-indent'
Plug 'plytophogy/vim-virtualenv'
Plug 'raimon49/requirements.txt.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'alfredodeza/pytest.vim'

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
Plug 'ncm2/nvim-typescript', {'do': './install.sh'}

" Markdown
Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

call plug#end()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

let g:session_autosave = 'no'
set backspace=indent,eol,start
"Globals
set scrolloff=5
set wildignore+=*.pyc


set laststatus=2

syntax enable
" set background=dark

" set termguicolors
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme nightfly
if exists('+termguicolors')
     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
     set termguicolors
endif

colorscheme spaceduck
let g:lightline = { 'colorscheme': 'spaceduck'}

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

noremap <F6> :CommandTFlush<CR>
nnoremap <F4> :set hlsearch!<CR>

" WhiteSpace
autocmd BufWritePre * ToggleStripWhitespaceOnSave

" move cursor at end of selection once yanked
vmap y ygv<ESC>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "FF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
local servers = { "pylsp", "rust_analyzer", "tsserver", "pyright", "jedi_language_server" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{ on_attach = on_attach }
end
nvim_lsp['terraformls'].setup{on_attach = on_attach, filetypes = { "terraform", "hcl", "tf"} }
EOF

"
" " Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <leader>p :Glow<CR>
nnoremap <leader>ff :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
