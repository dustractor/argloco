" ============================================================================
"
" File:        argloco.vim
"
" Maintainer:  Shams Kitz <dustractor at gmail dot com>
"
" License:     Permission is hereby granted, free of charge, to any person
"              obtaining a copy of this software and associated documentation
"              files (the "Software"), to deal in the Software without
"              restriction, including without limitation the rights to use,
"              copy, modify, merge, publish, distribute, sublicense, and/or
"              sell copies of the Software, and to permit persons to whom the
"              Software is furnished to do so, subject to the following
"              conditions:
"
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" ============================================================================

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

"  THIS IS THE LEGEND OF MAP
"  [1;10A --> option+shift+up
"  [1;10B --> option+shift+down
"  [1;10D --> option+shift+left
"  [1;10C --> option+shift+right
"    --> option+shift+k
"   Ô --> option+shift+j
"   Ó --> option+shift+h
"   Ò --> option+shift+l
