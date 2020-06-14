
function! spaceline#colors#match_background_color(midcolorname)
   let s:bgcolor = synIDattr(hlID("Normal"), "bg")
   if s:bgcolor ==''
     call add(a:midcolorname,'NONE')
   else
     call add(a:midcolorname, join(split(s:bgcolor,'#'),""))
   endif
   call add(a:midcolorname, 'NONE')
endfunction

function! spaceline#colors#spaceline_hl(group,slc,  fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp
    let histring = 'hi ' . a:group . ' '
    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(a:slc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif
    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(a:slc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif
    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:slc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif
    " echom histring
    execute histring
endfunction
