" =============================================================================
" Filename: spaceline.vim
" Author: glepnir
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#status#coc_status() abort
    let l:status=get(g:, 'coc_status', '')
    let l:statusbar=[]

    if &filetype ==? 'rust'
      let l:rust_status=substitute(l:status,"rust-analyzer ready","Ⓡ ","")
      let l:statusbar= split(l:rust_status)
    endif

    let l:js_ts = ['typescript','javascript','typescriptreact','javascriptreact']
    if index(l:js_ts,&filetype) >= 0
      let l:tsserver_status=substitute(l:status,"TSC","Ⓣ ","")
      let l:statusbar= split(l:tsserver_status)
    endif

    if &filetype ==? 'python'
      if empty($PYENV_ROOT)
        let l:python_status = substitute(l:status, "\\Python [0-9].[0-9].[0-9].[0-9][0-9]-bit", "ⓟ ", "")
        let l:statusbar= split(l:python_status)
      end
    endif

    if &filetype ==? "go"
        let l:gobar ="Ⓖ "
        call add(l:statusbar,l:gobar)
    endif

    let s = join(l:statusbar," ")
    if empty(s)
        return ""
    endif
    return join(['❖',s])
endfunction

