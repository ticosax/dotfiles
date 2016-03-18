let g:gundo_prefer_python3 = 1
let g:jedi#force_py_version = 3
let g:virtualenv_auto_activate = 1

set nosmartindent

set colorcolumn=80
" mapping in all modes
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" autocmd BufWritePost *.py call Flake8()
let g:loaded_python_provider = 1
let python_highlight_all=1

let g:vim_isort_map = '<C-i>'

" Sort Python imports.
command! -range=% -nargs=* Isort :<line1>,<line2>! isort --lines 79 <args> -
command! -range=% -nargs=* Isortdiff :<line1>,<line2>w !isort --lines 79 --diff <args> -"

" jedi.vim
let g:jedi#usages_command=""
let g:jedi#popup_select_first=0
let g:jedi#use_tabs_not_buffers=1
let g:jedi#show_call_signatures="2"
let g:jedi#auto_close_doc = 1

" neomake
autocmd! BufWritePost * Neomake

noremap <Leader>pdb Oimport pdb; pdb.set_trace()<esc>
