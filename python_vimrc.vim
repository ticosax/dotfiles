" display when text goes more than 79 chars
" highlight OverLength ctermbg=Red guibg=#592929
" 2match OverLength /\%81v.\+/
set colorcolumn=80

set nosmartindent

" mapping in all modes
map <Leader>pdb Oimport ipdb; ipdb.set_trace()<C-c>
map <Leader>u O# -*- coding: utf-8 -*-<C-c>
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" autocmd BufWritePost *.py call Flake8()
" let g:pymode = 1
" let g:pymode_run = 0
" let g:pymode_rope_vim_completion = 0
" let g:pymode_folding = 0
" let g:pymode_syntax = 0
