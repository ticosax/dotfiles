let g:gundo_prefer_python3 = 1

set nosmartindent

set colorcolumn=88
" mapping in all modes
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

let g:loaded_python_provider = 1
let python_highlight_all=1
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:vim_isort_map = '<C-i>'

noremap <Leader>br Obreakpoint()<esc>
