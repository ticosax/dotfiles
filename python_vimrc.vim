" python-mode
let g:pymode_python = 'python3'
let g:pymode_breakpoint = 'disabled'
let g:pymode_run = 0
let g:pymode_lint_ignore = "C0110"
let g:pymode_lint = 1
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_completion = 0
let g:pymode_folding = 0
let g:pymode_lint_unmodified = 1
let g:pymode_breakpoint = 0
" let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax = 1
" let g:pymode_syntax_all = 0
" let g:pymode_syntax_highlight_self = 1
" let g:pymode_syntax_string_format = 1
let g:pymode_rope = 0
let g:pymode = 1
let g:pymode_lint_sort = ['E', 'C', 'I']
" display when text goes more than 79 chars
" highlight OverLength ctermbg=Red guibg=#592929
" 2match OverLength /\%81v.\+/
let g:pymode_options_colorcolumn = 1

let g:gundo_prefer_python3 = 1
let g:jedi#force_py_version = 3
let g:virtualenv_auto_activate = 0

" syntastic
let g:syntastic_python_python_exec = '/usr/bin/python3.5'

set nosmartindent

" mapping in all modes
map <Leader>pdb Oimport pdb; pdb.set_trace()<C-c>
map <Leader>u O# -*- coding: utf-8 -*-<C-c>
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" autocmd BufWritePost *.py call Flake8()
let g:loaded_python_provider = 1
let g:vim_isort_map = '<C-i>'

" Sort Python imports.
command! -range=% -nargs=* Isort :<line1>,<line2>! isort --lines 79 <args> -
command! -range=% -nargs=* Isortdiff :<line1>,<line2>w !isort --lines 79 --diff <args> -"
