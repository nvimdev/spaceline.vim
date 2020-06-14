" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#status#coc_status() abort
    let status=get(g:, 'coc_status', '')
    let regstatus=substitute(status,"TSC","Ⓣ ","")
    let statusbar= split(regstatus)
    if &filetype ==? "go"
        let gobar ="Ⓖ "
        call add(statusbar,gobar)
    endif
    let s = join(statusbar," ")
    if empty(s)
        return ""
    endif
    return join(['❖',s])
endfunction

