" ====================================================================
" File:        argloco.vim
" Maintainer:  Shams Kitz <dustractor at gmail dot com>
" License:     GNU General Public Licence
" ====================================================================
"   Copyright (C) 2015 Shams Kitz
"   Shams Kitz
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
" ====================================================================
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_argloco")
    finish
endif
let g:loaded_argloco = 1

function! argloco#version()
    return '1.0.0'
endfunction

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
    nnoremap <F1> :call argloco#GoBackth()<CR>
    nnoremap <F2> :call argloco#GoForth()<CR>
endif

if s:map_the_arrows
    nnoremap [1;10A :call argloco#GoBackth()<CR>
    nnoremap [1;10B :call argloco#GoForth()<CR>
    nnoremap [1;10D :tabN<CR>
    nnoremap [1;10C :tabn<CR>
endif

if s:map_home_row
    nnoremap  :call argloco#GoBackth()<CR>
    nnoremap Ô :call argloco#GoForth()<CR>
    nnoremap Ó :tabN<CR>
    nnoremap Ò :tabn<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo

"  THIS IS THE LEGEND OF THE MAPPINGS
"  [1;10A --> option+shift+up
"  [1;10B --> option+shift+down
"  [1;10D --> option+shift+left
"  [1;10C --> option+shift+right
"    --> option+shift+k
"   Ô --> option+shift+j
"   Ó --> option+shift+h
"   Ò --> option+shift+l
