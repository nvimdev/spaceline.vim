
function! s:short_statusline() abort
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#emptySeperate1#"
    let s:statusline.=g:sep.emptySeperate1
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    return s:statusline
endfunction

function! s:SlantActiveStatusLine()
    let squeeze_width = winwidth(0) / 2
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=g:sep.homemoderight
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(spaceline#spaceline#Filesize()) && squeeze_width > 40
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=g:sep.filenameright
        "let s:statusline.="\ "
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.="%{spaceline#spaceline#ScrollBar()}"
    endif

    if !empty(spaceline#spaceline#VimacsLineCocError())|| !empty(spaceline#spaceline#VimacsLineCocWarn()) && squeeze_width >40
        let s:statusline.="\ "
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{spaceline#spaceline#VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{spaceline#spaceline#VimacsLineCocWarn()}"
        let s:statusline.="\ "
    else
        let s:statusline.="\ "
        let s:statusline.="%#VimMode#"
        "let s:statusline.="\["
        let s:statusline.="%{spaceline#spaceline#VimMode()}"
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        "let s:statusline.="\ "
        let s:statusline.=g:sep.gitleft
        "let s:statusline.="\ "
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#VimacsLineGitBranch()}"
        if !empty(get(b:,'coc_git_status',''))
          let diff_data = get(b:,'coc_git_status','')
          if matchend(diff_dta, '+') > 0
            let s:statusline.="%#GitAdd#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffAdd()}"
          endif
          if matchend(diff_data, '-') > 0
            let s:statusline.="%#GitRemove#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffRemove()}"
          endif
          if matchend(diff_data, '~') > 0
            let s:statusline.="%#GitModified#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffModified()}"
          endif
        endif
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=g:sep.gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx' && &filetype != 'coc-explorer' && &filetype != 'debui'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=g:sep.emptySeperate1
    endif
    if empty(spaceline#spaceline#Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=g:sep.emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=g:sep.lineinfoleft
    if squeeze_width > 40
      let s:statusline.="%#StatusEncod#"
      let s:statusline.="%{spaceline#spaceline#FileEncoding()}"
      let s:statusline.="\ "
      let s:statusline.="%#StatusFileFormat#%{spaceline#spaceline#VimacsLineFileformat()}"
    endif
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=g:sep.lineformatright
    let s:statusline.="\ "
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.="%{spaceline#spaceline#ScrollBar()}"
    return s:statusline
endfunction

function! s:ActiveStatusLine()
    let squeeze_width = winwidth(0) / 2
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=g:sep.homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(spaceline#spaceline#Filesize()) && squeeze_width > 40
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=g:sep.filenameright
        let s:statusline.="%#FileSize#"
        "let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        "let s:statusline.=\ "
        let s:statusline.=g:sep.filesizeright
    endif

    if !empty(spaceline#spaceline#VimacsLineCocError())|| !empty(spaceline#spaceline#VimacsLineCocWarn()) && squeeze_width >40
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{spaceline#spaceline#VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{spaceline#spaceline#VimacsLineCocWarn()}"
        let s:statusline.="\ "
    else
        let s:statusline.="%#VimMode#"
        let s:statusline.="\ "
        "let s:statusline.="\["
        let s:statusline.="%{spaceline#spaceline#VimMode()}"
        "let s:statusline.="\]"
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        let s:statusline.=g:sep.gitleft
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#VimacsLineGitBranch()}"
        let s:statusline.="\ "
        if !empty(get(b:,'coc_git_status',''))
          let diff_data = get(b:,'coc_git_status', '')
          if matchend(diff_data, '+') > 0
            let s:statusline.="%#GitAdd#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffAdd()}"
          endif
          if matchend(diff_data, '-') > 0
            let s:statusline.="%#GitRemove#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffRemove()}"
          endif
          if matchend(diff_data, '\~') > 0
            let s:statusline.="%#GitModified#"
            let s:statusline.= "%{spaceline#spaceline#GitDiffModified()}"
          endif
        endif
        let s:statusline.="%#GitRight#"
        let s:statusline.=g:sep.gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx' && &filetype != 'coc-explorer' && &filetype != 'debui'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=g:sep.emptySeperate1
    endif
    if empty(expand('%:t')) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=g:sep.emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=g:sep.lineinfoleft
    if squeeze_width > 40
      let s:statusline.="%#StatusEncod#"
      let s:statusline.="\ "
      let s:statusline.="%{spaceline#spaceline#FileEncoding()}"
      let s:statusline.="\ "
      let s:statusline.="%#StatusFileFormat#%{spaceline#spaceline#VimacsLineFileformat()}"
    endif
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=g:sep.lineformatright
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.="%{spaceline#spaceline#ScrollBar()}"
    return s:statusline
endfunction

function! s:InActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#FileName#"
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    return s:statusline
endfunction

function! s:Spaceline_Color(theme)
    let colorstring ='call'.' '.'spaceline#colorscheme#'.a:theme.'#'.a:theme.'()'
    execute colorstring
endfunction

function! s:SetStatusline()
    if index(g:spaceline_shortline_filetype, &filetype) >= 0
      let &l:statusline=s:short_statusline()
      call s:Spaceline_Color(g:spaceline_colorscheme)
      return
    endif
    if g:seperate_style == 'slant' || g:seperate_style == 'slant-fade'
      let &l:statusline=s:SlantActiveStatusLine()
      call s:Spaceline_Color(g:spaceline_colorscheme)
      return
    endif
    let &l:statusline=s:ActiveStatusLine()
    call s:Spaceline_Color(g:spaceline_colorscheme)
endfunction

function! spaceline#drawer#setInActiveStatusLine()
    let &l:statusline=s:InActiveStatusLine()
    call s:Spaceline_Color(g:spaceline_colorscheme)
endfunction

function! spaceline#drawer#spacelinetoggle()
	if get(g:,'loaded_spaceline',0) ==1
    call s:SetStatusline()
  else
    let &l:statusline=''
  endif
endfunction
