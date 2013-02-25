" display when text goes more than 79 chars
highlight OverLength ctermbg=Red guibg=#592929
2match OverLength /\%81v.\+/

set nosmartindent

" mapping in all modes
map <Leader>b Oimport ipdb; ipdb.set_trace()<C-c>
map <Leader>u O# -*- coding: utf-8 -*-<C-c>
