" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
scriptencoding utf-8
if exists('g:loaded_spaceline') || v:version < 700
  finish
endif
let g:loaded_spaceline = 1

let s:seperate_mode = get(g:, 'spaceline_seperate_mode', 0)
let s:seperate_style = get(g:, 'spaceline_seperate_style', 'arrow')
let s:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let s:sep= {}
if s:seperate_style ==1
        let s:sep = spaceline#seperator#spacelineCustomSeperate()
  else
        let s:sep = spaceline#seperator#spacelineStyle(s:seperate_style)
endif

function! s:SlantActiveStatusLine()
    if &filetype ==? 'defx' ||&filetype==?'vista' || &filetype ==? 'coc-explorer'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:sep.homemoderight
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:sep.EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:sep.homemoderight
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(spaceline#spaceline#Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:sep.filenameright
        "let s:statusline.="\ "
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.=s:sep.filesizeright
    endif
    if !empty(spaceline#spaceline#VimacsLineCocError())|| !empty(spaceline#spaceline#VimacsLineCocWarn())
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
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        "let s:statusline.="\ "
        let s:statusline.=s:sep.gitleft
        "let s:statusline.="\ "
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:sep.gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx' && &filetype != 'coc-explorer'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:sep.emptySeperate1
    endif
    if empty(spaceline#spaceline#Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:sep.emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:sep.lineinfoleft
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="%{spaceline#spaceline#FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{spaceline#spaceline#VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:sep.lineformatright
    let s:statusline.="\ "
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:sep.EndSeperate
    return s:statusline
endfunction

function! s:SlantInActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:sep.homemoderight
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:sep.EndSeperate
    return s:statusline
endfunction

function! s:ActiveStatusLine()
    if &filetype ==? 'defx' || &filetype==?'vista' || &filetype==?'coc-explorer'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:sep.homemoderight
        let s:statusline.="%#FileName#"
        let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:sep.EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:sep.homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(spaceline#spaceline#Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:sep.filenameright
        let s:statusline.="%#FileSize#"
        "let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        "let s:statusline.=\ "
        let s:statusline.=s:sep.filesizeright
    endif

    if !empty(spaceline#spaceline#VimacsLineCocError())|| !empty(spaceline#spaceline#VimacsLineCocWarn())
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
        let s:statusline.=s:sep.gitleft
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{spaceline#spaceline#VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:sep.gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx' && &filetype != 'coc-explorer'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:sep.emptySeperate1
    endif
    if empty(spaceline#spaceline#Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:sep.emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:sep.lineinfoleft
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="\ "
    let s:statusline.="%{spaceline#spaceline#FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{spaceline#spaceline#VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:sep.lineformatright
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:sep.EndSeperate
    return s:statusline
endfunction
function! s:InActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{spaceline#spaceline#VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:sep.homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="%{spaceline#spaceline#VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{spaceline#spaceline#VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:sep.EndSeperate
    return s:statusline
endfunction

function! s:Spaceline_Color(theme)
    let colorstring ='call'.' '.'spaceline#colorscheme#'.a:theme.'#'.a:theme.'()'
    execute colorstring
endfunction

function! s:SetStatusline()
    if s:seperate_mode ==1
        let &l:statusline=s:ActiveStatusLine()
        call s:Spaceline_Color(s:spaceline_colorscheme)
        return
    endif
    if s:seperate_style == 'slant' || s:seperate_style == 'slant-fade'
        let &l:statusline=s:SlantActiveStatusLine()
        call s:Spaceline_Color(s:spaceline_colorscheme)
        return
    endif
    let &l:statusline=s:ActiveStatusLine()
    call s:Spaceline_Color(s:spaceline_colorscheme)
endfunction

function! s:SetInActiveStatusLine()
    if s:seperate_mode ==1
        let &l:statusline=s:ActiveStatusLine()
        call s:Spaceline_Color(s:spaceline_colorscheme)
        return
    endif
    if s:seperate_style == 'slant'
        let &l:statusline=s:SlantInActiveStatusLine()
        call s:Spaceline_Color(s:spaceline_colorscheme)
        return
    endif
    let &l:statusline=s:InActiveStatusLine()
    call s:Spaceline_Color(s:spaceline_colorscheme)
endfunction

function! s:SpacelineToggle()
	if get(g:,'loaded_spaceline',0) ==1
    call s:SetStatusline()
  else
    let &l:statusline=''
  endif
endfunction

augroup spaceline
  autocmd!
  autocmd FileType,WinEnter,BufWinEnter,BufReadPost  * call s:SpacelineToggle()
  autocmd WinLeave * call s:SetInActiveStatusLine()
  autocmd BufNewFile,ShellCmdPost,BufWritePost * call s:SpacelineToggle()
  autocmd FileChangedShellPost,ColorScheme * call s:SpacelineToggle()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call s:SpacelineToggle()
  autocmd User CocStatusChange,CocGitStatusChange call s:SpacelineToggle()
  autocmd User CocDiagnosticChange call s:SpacelineToggle()
augroup END "}}}
