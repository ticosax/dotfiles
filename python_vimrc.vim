let g:gundo_prefer_python3 = 1
" let g:jedi#force_py_version = 3
let g:virtualenv_auto_activate = 1
let g:vim_isort_python_version = 'python3'

set nosmartindent

set colorcolumn=88
" mapping in all modes
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" autocmd BufWritePost *.py call Flake8()
let g:loaded_python_provider = 1
let python_highlight_all=1
let g:neomake_python_enabled_makers = ['python', 'flake8']
let g:neomake_open_list = 2
" https://github.com/neomake/neomake/issues/1097#issuecomment-298780826
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:vim_isort_map = '<C-i>'

" Sort Python imports.
command! -range=% -nargs=* Isort :<line1>,<line2>! isort --lines 90 <args> -
command! -range=% -nargs=* Isortdiff :<line1>,<line2>w !isort --lines 90 --diff <args> -"

" jedi.vim
let g:jedi#show_call_signatures="2"
let g:jedi#auto_close_doc = 1

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

noremap <Leader>pdb Oimport pdb; pdb.set_trace()<esc>
noremap <Leader>br Obreakpoint()<esc>
