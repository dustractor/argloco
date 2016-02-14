" plugin/argloco.vim

"{{{1 Wipe out nameless buffers
fun! s:WipeoutNonames()
    for i in range(bufnr('$'),1,-1)
        if bufname(i) == ""
            exe "bw ".i
        endif
    endfor
endfun

"{{{1 Make taboo tabs with local argument lists
fun! argloco#TabArgs(tabargls)
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
    call s:WipeoutNonames()
    echo "ok"
endfun

"{{{1 Functions for moving around the argument list
fun! argloco#LargLBack()
    if argidx() == 0
        exe "argu ".argc()
    else
        exe "N"
    endif
endfun

fun! argloco#LargLForth()
    if argidx() == ( argc() - 1 )
        exe "rew"
    else
        exe "n"
    endif
endfun

"{{{1 Functions for moving amongst the tabs
fun! argloco#GoBackth()
    if exists('t:taboo_tab_name')
        call argloco#LargLBack()
    else
        exe 'bN'
    endif
endfun

fun! argloco#GoForth()
    if exists('t:taboo_tab_name')
        call argloco#LargLForth()
    else
        exe 'bn'
    endif
endfun
