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

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'kristijanhusak/completion-tags'
Plug 'hrsh7th/nvim-compe'

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

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debuggers
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'

Plug 'onsails/lspkind-nvim'
" Status lines
Plug 'hoob3rt/lualine.nvim'
" Files
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" tablines
" Plug 'bagrat/vim-buffet'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
" Plug 'liuchengxu/eleline.vim'

" colorschemes
Plug 'wadackel/vim-dogrun'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'mhartington/oceanic-next'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'NTBBloodbath/doom-one.nvim', {'branch': 'main'}

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
Plug 'plytophogy/vim-virtualenv'
Plug 'raimon49/requirements.txt.vim'
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

" Markdown
Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

call plug#end()


let g:session_autosave = 'no'
set backspace=indent,eol,start
"Globals
set scrolloff=5
set wildignore+=*.pyc


set laststatus=2
lua << EOF
require('lualine').setup{ options = { theme = 'molokai'} }
EOF

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

colorscheme nightfly
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

nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fB <cmd>Telescope file_browser<cr>

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
local servers = { "pylsp", "rust_analyzer", "tsserver", "jedi_language_server", "pyright", "graphql", "tflint", "yamlls", "dockerls", "terraformls", "vimls", "jsonls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{ on_attach = on_attach }
end
nvim_lsp['terraformls'].setup{on_attach = on_attach, filetypes = { "terraform", "hcl", "tf"} }
nvim_lsp['sqlls'].setup{cmd = {"sql-language-server", "up", "--method", "stdio"}}
EOF

autocmd BufEnter * lua require'completion'.on_attach()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" " Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <leader>p :Glow<CR>

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF
"Treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
   incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

" DAP
lua require('dap-python').setup('python')
lua require('dap-python').test_runner = 'pytest'
lua require("dapui").setup()
nnoremap <silent> <leader>dr :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <leader>dm :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>dk :lua require('dap-python').test_class()<CR>
nnoremap <silent> <leader>dc :lua require('dap').continue()<CR>
nnoremap <silent> <leader>ds :lua require('dap').step_into()<CR>
vnoremap <silent> <leader>dv <ESC>:lua require('dap-python').debug_selection()<CR>
