" Drupal *.module and *.install files.
augroup drupal_files
  autocmd!
  autocmd BufRead,BufNewFile *.module  set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test    set filetype=php
  autocmd BufRead,BufNewFile *.inc     set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view    set filetype=php
augroup END

" Bind/NSD3 *.zone
augroup bind_files
  autocmd!
  autocmd BufRead,BufNewFile *.zone set filetype=bindzone
  autocmd FileType bindzone setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" Syntastic
"  let g:syntastic_auto_loc_list=1
"  let g:syntastic_check_on_open=1
"  let g:syntastic_javascript_checkers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufReadPost,BufWritePost * Neomake

" Code Folding for vimrc
" augroup vimrc_folding
"   autocmd FileType vim setlocal foldmethod=indent
" augroup END
