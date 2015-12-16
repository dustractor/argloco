" ============================================================================
" File:        argloco.vim
" Maintainer:  Shams Kitz <dustractor at gmail dot com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

if exists("g:loaded_argloco")
    finish
endif
let g:loaded_argloco = 1

function! argloco#version()
    return '1.0.0'
endfunction

com LarglN call argloco#GoBackth()
com Largln call argloco#GoForth()

" F1 and F2 to traverse arglist
nnoremap <F1> :LarglN<CR>
nnoremap <F2> :Largln<CR>
"Moving in arglist/bufferlist
"[1;10A --> option+shift+up -->
nnoremap [1;10A :LarglN<CR>
"[1;10B --> option+shift+down -->
nnoremap [1;10B :Largln<CR>
" or option+shift+j --> Ô
nnoremap Ô :LarglN<CR>
" or option+shift+k --> 
nnoremap  :Largln<CR>
"Moving amongst tabs
"[1;10D --> option+shift+left -->
nnoremap [1;10D :tabN<CR>
"[1;10C --> option+shift+right -->
nnoremap [1;10C :tabn<CR>
"or option+shift+h --> Ó
nnoremap Ó :tabN<CR>
" or option+shift+l --> Ò
nnoremap Ò :tabn<CR>
