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
" Description: Adds 2 commands: LarglN and Largln for traversing local
" arglist.  Optional helper mappings can be enabled.
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_argloco")
    finish
endif
let g:loaded_argloco = 1

function! argloco#version()
    return '1.0.0'
endfunction

com LarglN call argloco#GoBackth()
com Largln call argloco#GoForth()

if exists("g:argloco_map_all")
    let s:map_the_arrows = 1
    let s:map_function_keys = 1
    let s:map_home_row = 1
else
    let s:map_the_arrows = get(g:,"argloco_map_the_arrows",0)
    let s:map_function_keys = get(g:,"argloco_map_function_keys",0)
    let s:map_home_row = get(g:,"argloco_map_home_row",0)
endif

if s:map_function_keys
    nnoremap <F1> :LarglN<CR>
    nnoremap <F2> :Largln<CR>
endif

if s:map_the_arrows
    nnoremap [1;10A :LarglN<CR>
    nnoremap [1;10B :Largln<CR>
    nnoremap [1;10D :tabN<CR>
    nnoremap [1;10C :tabn<CR>
endif

if s:map_home_row
    nnoremap  :LarglN<CR>
    nnoremap Ô :Largln<CR>
    nnoremap Ó :tabN<CR>
    nnoremap Ò :tabn<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo

"  LEGEND OF MAP
"  [1;10A --> option+shift+up
"  [1;10B --> option+shift+down
"  [1;10D --> option+shift+left
"  [1;10C --> option+shift+right
"    --> option+shift+k
"   Ô --> option+shift+j
"   Ó --> option+shift+h
"   Ò --> option+shift+l
