" stausline 
function! s:vimacsline_is_lean() abort
  return &filetype =~? '\v^defx|mundo(diff)?$'
endfunction

function! s:vimacsline_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|defx|vista_kind|vista|tagbar$'
endfunction


function! VimacsLineinfo() abort
    return &filetype ==? 'help'             ? ''  :
  \      &filetype ==? 'defx'             ? ' ' :
  \      &filetype ==? 'denite'           ? ' ' :
  \      &filetype ==? 'tagbar'           ? ' ' :
  \      &filetype ==? 'vista_kind'       ? ' ' :
  \      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
  \      s:vimacsline_is_lean() || s:vimacsline_is_plain() ? ' '  :
  \      printf('☰ %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

function! Filesize()abort
  if empty(expand('%:t'))
    return ''
  endif
  if &filetype ==? 'defx'
      return ''
  endif
    return "ﴬ".Fsize(@%)
endfunction

function! Fsize(f) abort
    let l:size = getfsize(expand(a:f))
  if l:size == 0 || l:size == -1 || l:size == -2
    return ''
  endif
  if l:size < 1024
    let size = l:size.' bytes'
  elseif l:size < 1024*1024
    let size = printf('%.1f', l:size/1024.0).'k'
  elseif l:size < 1024*1024*1024
    let size = printf('%.1f', l:size/1024.0/1024.0) . 'm'
  else
    let size = printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
  endif
  return " ".size
endfunction

function! VimacslineMode() abort
    return s:vimacsline_is_lean() || s:vimacsline_is_plain() ? toupper(&filetype) : Vimacslinemode()
endfunction

function! Vimacslinemode()
  let nr = s:get_buffer_number()
  let nmap = [ '⓿ ',  '❶ ',  '➋ ',  '❸ ', '❹ ','❺ ',  '❻ ',  '❼ ',  '❽ ',  '❾ ','➓ ','⓫ ','⓬ ','⓭ ','⓮ ','⓯ ','⓰ ','⓱ ','⓲ ','⓳ ','⓴ ']
  if nr == 0
    return ''
  endif
  let l:number = nr
  let l:result = ''
  for i in range(1, strlen(l:number))
    let l:result = get(nmap, l:number % 10, l:number % 10) . l:result
    let l:number = l:number / 10
  endfor
  return join(['ﮭ',l:result])
endfunction
function! s:get_buffer_number()
  let i = 0
  for nr in filter(range(1, bufnr('$')), 'bufexists(v:val) && buflisted(v:val)')
    let i += 1
    if nr == bufnr('')
      return i
    endif
  endfor
  return ''
endfunction

function! VimacsFilenameActive() abort
  if s:vimacsline_is_lean()
    return ''
  endif
  if &buftype ==? 'terminal'
    return has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : ''
  endif
  if &filetype ==? 'tagbar'
    return ''
  endif
  if &filetype ==? 'vista'
    return ''
  endif
  if &filetype ==? 'defx'
      return ''
  endif
  if empty(expand('%:t'))
    return '[No Name]'
  endif

  let mo = s:vimacsline_modified()
  return empty(mo) ? VimacsLineFname() : VimacsLineFname() . ' ' . mo
endfunction


function! s:vimacsline_modified() abort
  return s:vimacsline_is_lean() || s:vimacsline_is_plain() ?  ''  :
  \      &modified                                       ?  '' :
  \      &modifiable                                     ?  ''  : '-'
endfunction

function! VimacsLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! VimacsLineGit()abort
    if &filetype ==? 'defx'
       return ""
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    let gitcount=get(b:, 'coc_git_status', '')
    let gitinfo = []
    if empty(gitbranch)
	    let gitbranch=""
        return ""
    endif
    if empty(gitcount)
	    let gitcount=""
    endif
    call add(gitinfo,gitbranch)
    call add(gitinfo,gitcount)
    return trim(join(gitinfo,''))
endfunction

function! CocStatusBar() abort
    let status=get(g:, 'coc_status', '')
    if empty(status)
        return ""
    endif
    let regstatus=substitute(status,"TSC","Ⓣ ","")
    let statusbar= split(regstatus)
    if &filetype ==? "go"
        let gobar ="Ⓖ "
        call add(statusbar,gobar)
    endif
    "return join(statusbar," ")
    let s = join(statusbar," ")
    if empty(s)
        return ""
    endif
    if &filetype ==? 'defx'
        return ""
    endif
    if &filetype ==? 'vista'
        return ""
    endif
     return join(['❖',s])
endfunction

function! VimacsLineCocError()
  let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, error_sign . info['error'])
  endif
  return join(errmsgs, ' ')
endfunction

function! VimacsLineCocWarn() abort
  let warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, warning_sign . info['warning'])
  endif
 return join(warnmsgs, ' ')
endfunction
function! VimacslineCocFixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction
" Diagnostic's feedback {{{
function! CocUpdateQuickFixes(error, actions) abort
  let coc_quickfixes = {}
  try
    for action in a:actions
      if action.kind ==? 'quickfix'
        for change in action.edit.documentChanges
          for edit in change.edits
            let start_line = edit.range.start.line + 1
            let end_line = edit.range.end.line + 1
            let coc_quickfixes[start_line] = get(coc_quickfixes, start_line, 0) + 1
            if start_line != end_line
              let coc_quickfixes[end_line] = get(coc_quickfixes, end_line, 0) + 1
            endif
          endfor
        endfor
      endif
    endfor
  catch
  endtry
  if coc_quickfixes != get(b:, 'coc_quickfixes', {})
    let b:coc_quickfixes = coc_quickfixes
    call lightline#update()
  endif
endfunction

function! VimacsLineFname()
  let icon = (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft')
  let filename = VimacsLineFilename()
  let ret = [filename,icon]
  if filename == ''
    return ''
  endif
  return join([icon,filename],' ')
endfunction
function! VimacsLineFilename()
  return ('' != VimacsLineReadonly() ? VimacsLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '')
endfunction
function! FileEncoding()
    if &filetype==?'defx'
        return ""
    endif
     let l:encod = (&fenc!=#""?&fenc:&enc)
     return "".' '.l:encod
endfunction

function! VimacsLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! VimacsLineFileformat()
    if &filetype==? 'defx'
        return ""
    endif
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol().' '.&fileformat . ' ' ) : ''
endfunction

function! HeartErrorSymbol()
  let l:cocdiaginfo = get(b:, 'coc_diagnostic_info', {})
  if empty(l:cocdiaginfo)
    return ''
  endif
  return " "
endfunction


hi HomeMode ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
hi Seperate ctermbg=237 ctermfg=265 guibg=#3c3836 guifg=#bd93f9

hi FileName ctermbg=black ctermfg=188 guibg=black guifg=#d7d7d7
hi Seperate1 ctermbg=black ctermfg=214 guibg=black guifg=#fabd2f

hi Seperate2 ctermbg=black ctermfg=261 guibg=black guifg=#5d4d7a
hi Filesize ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
hi Seperate3 ctermbg=black ctermfg=261 guibg=black guifg=#5d4d7a

hi HeartSymbol ctermbg=black ctermfg=130 guibg=black guifg=#af5f00
hi CocError ctermbg=black ctermfg=124 guibg=black guifg=#cc241d
hi CocWarn ctermbg=black ctermfg=32 guibg=black guifg=#0087d7

hi GitInfo ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
hi Seperate5 ctermbg=237 ctermfg=261 guibg=#3c3836 guifg=#5d4d7a

hi CocBar ctermbg=237 ctermfg=225 guibg=#3c3836 guifg=#6272a4

hi Seperate4 ctermbg=237 ctermfg=black guibg=#3c3836 guifg=black
hi StatusEncod ctermbg=black ctermfg=225 guibg=black guifg=#6272a4
hi StatusFileFormat ctermbg=black ctermfg=225 guibg=black guifg=#6272a4
hi StatusLineinfo ctermbg=237 ctermfg=black guibg=black guifg=#6272a4
hi EndSeperate ctermbg=214 ctermfg=55 guibg=#fabd2f guifg=#5f00af

hi VimMode ctermbg=black ctermfg=148 guibg=black guifg=#afd700

hi emptySeperate1 ctermbg=237 ctermfg=black guibg=#3c3836 guifg=black

function! s:ActiveStatusLine()
    if &filetype ==? 'defx' ||&filetype==?'vista'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{VimacslineMode()}"
        let s:statusline.="%#Seperate1#"
        let s:statusline.="\"
        let s:statusline.="\ "
        let s:statusline.="%#FileName#"
        let s:statusline.="%{VimacsFilenameActive()}"
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusEncod#%{FileEncoding()}"
        let s:statusline.="\ "
        let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
        let s:statusline.="\ "
        let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.="\"
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#Seperate1#"
    let s:statusline.="\"
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(Filesize())
        let s:statusline.="%#Seperate2#"
        let s:statusline.="\"
        let s:statusline.="\ "
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#Seperate3#"
        let s:statusline.="\"
    endif

    if !empty(VimacsLineCocError())|| !empty(VimacsLineCocWarn())||!empty(VimacslineCocFixes())
        let s:statusline.="\ "
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="\ "
        let s:statusline.="%{HeartErrorSymbol()}"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{VimacsLineCocWarn()}"
        let s:statusline.="\ "
        let s:statusline.="%{VimacslineCocFixes()}"
        let s:statusline.="\ "
    else
        let s:statusline.="\ "
        let s:statusline.="%#VimMode#"
        let s:statusline.="\["
        let s:statusline.="%{VimMode()}"
        let s:statusline.="\]"
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#Seperate2#"
        let s:statusline.="\"
        let s:statusline.="\ "
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#Seperate5#"
        let s:statusline.="\"
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.="\"
    endif
    if empty(Filesize())
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.="\"
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#Seperate4#"
    let s:statusline.="\"
    let s:statusline.="\ "
    let s:statusline.="%#StatusEncod#%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.="\"
    return s:statusline
endfunction

function! VimMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "N"
  elseif l:mode==?"v"
    return "V"
  elseif l:mode==#"i"
    return "I"
  elseif l:mode==#"R"
    return "R"
  elseif l:mode==?"s"
    return "S"
  elseif l:mode==#"t"
    return "T"
  elseif l:mode==#"c"
    return "C"
  elseif l:mode==#"!"
    return "SE"
  endif
endfunction

function! s:InActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#Seperate1#"
    let s:statusline.="\"
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="\ "
    let s:statusline.="%#StatusEncod#%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.="\"
    return s:statusline
endfunction

function! SetStatusline()
    let &l:statusline=s:ActiveStatusLine()
endfunction

function! SetInActiveStatusLine()
    let &l:statusline=s:InActiveStatusLine()
endfunction

augroup statusline
	autocmd!
	autocmd FileType,WinEnter,BufWinEnter,BufReadPost  * call SetStatusline()
    autocmd WinLeave * call SetInActiveStatusLine()
    autocmd BufNewFile,ShellCmdPost,BufWritePost * call SetStatusline()
    autocmd FileChangedShellPost,ColorScheme * call SetStatusline()
    autocmd FileReadPre,ShellCmdPost,FileWritePost * call SetStatusline()
    autocmd User CocStatusChange,CocGitStatusChange call SetStatusline()
    autocmd  User CocDiagnosticChange
        \   call SetStatusline()
        \|  call CocActionAsync('quickfixes', function('CocUpdateQuickFixes'))
augroup END "}}}
