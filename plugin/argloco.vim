" plugin/argloco.vim
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
    return '1.2.3'
endfunction

com! GoBackth call argloco#GoBackth()
com! GoForth call argloco#GoForth()

com! -nargs=1 ArgLoco call argloco#Argloco(<args>)

let s:do_map_back = 0
let s:do_map_forth = 0

if exists("g:argloco_map_all")
    let s:do_map_back = 1
    let s:do_map_forth = 1
else
    let s:do_map_back = exists("g:argloco_map_back")
    let s:do_map_forth = exists("g:argloco_map_forth")
endif

if s:do_map_back
    let s:map_back = get(g:,"argloco_map_back",'<X1Mouse>')
endif

if s:do_map_forth
    let s:map_forth = get(g:,"argloco_map_forth",'<X2Mouse>')
endif

let s:mapfmt = 'nnoremap %s :%s<CR>'

if s:do_map_back
    exec printf(s:mapfmt,s:map_back,'GoBackth')
endif

if s:do_map_forth
    exec printf(s:mapfmt,s:map_forth,'GoForth')
endif

let &cpo = s:save_cpo

unlet s:save_cpo

