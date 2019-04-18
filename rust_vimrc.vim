let g:rustfmt_autosave = 1

" vim-racer
let g:racer_cmd = "/home/nicolas/.cargo/bin/racer"
let g:deoplete#sources#rust#racer_binary = "/home/nicolas/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
