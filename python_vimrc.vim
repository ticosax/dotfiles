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
" display when text goes more than 79 chars
" highlight OverLength ctermbg=Red guibg=#592929
" 2match OverLength /\%81v.\+/
let g:pymode_options_colorcolumn = 1

set nosmartindent

" mapping in all modes
map <Leader>pdb Oimport pdb; pdb.set_trace()<C-c>
map <Leader>u O# -*- coding: utf-8 -*-<C-c>
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" autocmd BufWritePost *.py call Flake8()
let g:pymode_rope = 0
" let g:pymode = 1
" let g:pymode_run = 0
" let g:pymode_rope_vim_completion = 0
let g:pymode_folding = 0
" let g:pymode_syntax = 0
let g:pymode_lint_sort = ['E', 'C', 'I']
