
"{{{1 Wipe out nameless buffers

function! s:BufWipeoutNameless()
    for i in range(bufnr('$'),1,-1)
        if bufname(i) == ""
            exe "bw ".i
        endif
    endfor
endfunction

"{{{1 Make taboo tabs with local argument lists

function! argloco#Argloco(tabargls)
    let l:madefirst = 0
    for [tabname,tabargs] in a:tabargls
        if l:madefirst == 0
            exe "TabooRename " . l:tabname
            let l:madefirst = 1
        else
            exe "TabooOpen " . l:tabname
        endif
        silent exe "arglocal " . l:tabargs
    endfor
    call s:BufWipeoutNameless()
endfunction

"{{{1 Functions for moving around the argument list

function! argloco#LargLBack()
    if argidx() == 0
        exe "argu ".argc()
    else
        exe "N"
    endif
endfunction

function! argloco#LargLForth()
    if argidx() == ( argc() - 1 )
        exe "rew"
    else
        exe "n"
    endif
endfunction

"{{{1 Functions for moving amongst the tabs

function! argloco#GoBackth()
    if exists('t:taboo_tab_name')
        call argloco#LargLBack()
    else
        exe 'bN'
    endif
endfunction

function! argloco#GoForth()
    if exists('t:taboo_tab_name')
        call argloco#LargLForth()
    else
        exe 'bn'
    endif
endfunction

