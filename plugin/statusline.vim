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
let s:homemoderight = ""
let s:filenameright = ""
let s:filesizeright = ""
let s:gitleft = ""
let s:gitright = ""
let s:lineinfoleft = ""
let s:EndSeperate = ""
let s:emptySeperate1 = ""

function! s:spacelineCustomSeperate()
        let s:homemoderight = get(g:, 'spaceline_homemode_right','')
        let s:filenameright = get(g:, 'spaceline_filename_left','')
        let s:filesizeright = get(g:, 'spaceline_filesize_right','')
        let s:gitleft = get(g:, 'spaceline_seperate_2','')
        let s:gitright = get(g:, 'spaceline_gitinfo_right','')
        let s:lineinfoleft = get(g:, 'spaceline_cocexts_right','')
        let s:lineformatright = get(g:, 'spaceline_lineformat_right', '')
        let s:EndSeperate = get(g:, 'spaceline_seperate_endseperate','')
        let s:emptySeperate1 = get(g:, 'spaceline_seperate_emptyseperate','')
endfunction
function! s:spacelineStyle(style)
    if a:style == 'slant'
        let s:homemoderight = ''
        let s:filenameright = ''
        let s:filesizeright = ''
        let s:gitleft = ''
        let s:gitright = ''
        let s:lineinfoleft = ''
        let s:lineformatright = ''
        let s:EndSeperate = ''
        let s:emptySeperate1 = ''
    elseif a:style == 'arrow'
        let s:homemoderight = ''
        let s:filenameright = ''
        let s:filesizeright = ''
        let s:gitleft = ''
        let s:gitright = ''
        let s:lineinfoleft = ''
        let s:lineformatright = ''
        let s:EndSeperate = ''
        let s:emptySeperate1 = ''
    elseif a:style == 'curve'
        let s:homemoderight = ''
        let s:filenameright = ''
        let s:filesizeright = ''
        let s:gitleft = ''
        let s:gitright = ''
        let s:lineinfoleft = ''
        let s:lineformatright = ''
        let s:EndSeperate = ''
        let s:emptySeperate1 = ''
    endif
endfunction

if s:seperate_style ==1
        call s:spacelineCustomSeperate()
  else
        call s:spacelineStyle(s:seperate_style)
endif

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
    if &filetype==? 'defx'
        return ""
    endif
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

function! s:CurveActiveStatusLine()
    if &filetype ==? 'defx' || &filetype==?'vista'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:homemoderight
        let s:statusline.="%#FileName#"
        let s:statusline.="%{VimacsFilenameActive()}"
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:filenameright
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.="\ "
        let s:statusline.=s:filesizeright
    endif

    if !empty(VimacsLineCocError())|| !empty(VimacsLineCocWarn())||!empty(VimacslineCocFixes())
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="\ "
        let s:statusline.="%{HeartErrorSymbol()}"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{VimacsLineCocWarn()}"
        let s:statusline.="\ "
    else
        let s:statusline.="%#VimMode#"
        let s:statusline.="\ "
        let s:statusline.="\["
        let s:statusline.="%{VimMode()}"
        let s:statusline.="\]"
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        let s:statusline.=s:gitleft
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    if empty(Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:lineinfoleft
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="\ "
    let s:statusline.="%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:lineformatright
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction

function! s:CurveInActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction

function! s:CurveColor()
    hi HomeMode ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
    hi HomeModeRight ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
    hi FileName ctermbg=black ctermfg=188 guibg=black guifg=#d7d7d7
    hi FileNameRight ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi Filesize ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi FileSizeRight ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi HeartSymbol ctermbg=black ctermfg=130 guibg=black guifg=#af5f00
    hi CocError ctermbg=black ctermfg=124 guibg=black guifg=#cc241d
    hi CocWarn ctermbg=black ctermfg=32 guibg=black guifg=#0087d7
    hi GitLeft ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi GitInfo ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi Gitright ctermbg=261 ctermfg=237 guibg=#5d4d7a guifg=#3c3836
    hi CocBar ctermbg=237 ctermfg=225 guibg=#3c3836 guifg=#6272a4
    hi LineInfoLeft ctermbg=237 ctermfg=261 guibg=#3c3836 guifg=#5d4d7a
    hi StatusEncod ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi StatusFileFormat ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi LineFormatRight ctermbg=261 ctermfg=261 guibg=black guifg=#5d4d7a
    hi StatusLineinfo ctermbg=237 ctermfg=225 guibg=black guifg=#6272a4
    hi EndSeperate ctermbg=214 ctermfg=55 guibg=#fabd2f guifg=#5f00af
    hi VimMode ctermbg=black ctermfg=148 guibg=black guifg=#afd700
    hi emptySeperate1 ctermbg=237 ctermfg=black guibg=#3c3836 guifg=black
endfunction

function! s:SlantActiveStatusLine()
    if &filetype ==? 'defx' ||&filetype==?'vista'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:homemoderight
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:filenameright
        let s:statusline.="\ "
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.=s:filesizeright
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
    else
        let s:statusline.="\ "
        let s:statusline.="%#VimMode#"
        let s:statusline.="\["
        let s:statusline.="%{VimMode()}"
        let s:statusline.="\]"
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        let s:statusline.=s:gitleft
        let s:statusline.="\ "
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    if empty(Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:lineinfoleft
    let s:statusline.="\ "
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:lineformatright
    let s:statusline.="\ "
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction

function! s:SlantInActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="\ "
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction
function! s:SlantColor()
    hi HomeMode ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
    hi HomeModeRight ctermbg=black ctermfg=214 guibg=black guifg=#fabd2f
    hi FileName ctermbg=black ctermfg=188 guibg=black guifg=#d7d7d7
    hi FileNameRight ctermbg=black ctermfg=261 guibg=black guifg=#5d4d7a
    hi Filesize ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi FileSizeRight ctermbg=black ctermfg=261 guibg=black guifg=#5d4d7a
    hi HeartSymbol ctermbg=black ctermfg=130 guibg=black guifg=#af5f00
    hi CocError ctermbg=black ctermfg=124 guibg=black guifg=#cc241d
    hi CocWarn ctermbg=black ctermfg=32 guibg=black guifg=#0087d7
    hi GitLeft ctermbg=black ctermfg=261 guibg=black guifg=#5d4d7a
    hi GitInfo ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi Gitright ctermbg=237 ctermfg=261 guibg=#3c3836 guifg=#5d4d7a
    hi CocBar ctermbg=237 ctermfg=225 guibg=#3c3836 guifg=#6272a4
    hi LineInfoLeft ctermbg=237 ctermfg=261 guibg=#3c3836 guifg=#5d4d7a
    hi StatusEncod ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi StatusFileFormat ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi LineFormatRight ctermbg=261 ctermfg=261 guibg=black guifg=#5d4d7a
    hi StatusLineinfo ctermbg=237 ctermfg=225 guibg=black guifg=#6272a4
    hi EndSeperate ctermbg=214 ctermfg=55 guibg=#fabd2f guifg=#5f00af
    hi VimMode ctermbg=black ctermfg=148 guibg=black guifg=#afd700
    hi emptySeperate1 ctermbg=237 ctermfg=black guibg=#3c3836 guifg=black
endfunction

function! s:ArrowActiveStatusLine()
    if &filetype ==? 'defx' || &filetype==?'vista'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:homemoderight
        let s:statusline.="%#FileName#"
        let s:statusline.="%{VimacsFilenameActive()}"
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:filenameright
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.="\ "
        let s:statusline.=s:filesizeright
    endif

    if !empty(VimacsLineCocError())|| !empty(VimacsLineCocWarn())||!empty(VimacslineCocFixes())
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="\ "
        let s:statusline.="%{HeartErrorSymbol()}"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{VimacsLineCocWarn()}"
        let s:statusline.="\ "
    else
        let s:statusline.="%#VimMode#"
        let s:statusline.="\ "
        let s:statusline.="\["
        let s:statusline.="%{VimMode()}"
        let s:statusline.="\]"
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        let s:statusline.=s:gitleft
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    if empty(Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:lineinfoleft
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="\ "
    let s:statusline.="%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:lineformatright
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction
function! s:ArrowInActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction

function! s:ArrowColor()
    hi HomeMode ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
    hi HomeModeRight ctermbg=214 ctermfg=black guibg=#fabd2f guifg=black
    hi FileName ctermbg=black ctermfg=188 guibg=black guifg=#d7d7d7
    hi FileNameRight ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi Filesize ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi FileSizeRight ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi HeartSymbol ctermbg=black ctermfg=130 guibg=black guifg=#af5f00
    hi CocError ctermbg=black ctermfg=124 guibg=black guifg=#cc241d
    hi CocWarn ctermbg=black ctermfg=32 guibg=black guifg=#0087d7
    hi GitLeft ctermbg=261 ctermfg=black guibg=#5d4d7a guifg=black
    hi GitInfo ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi Gitright ctermbg=261 ctermfg=237 guibg=#5d4d7a guifg=#3c3836
    hi CocBar ctermbg=237 ctermfg=225 guibg=#3c3836 guifg=#6272a4
    hi LineInfoLeft ctermbg=237 ctermfg=261 guibg=#3c3836 guifg=#5d4d7a
    hi StatusEncod ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi StatusFileFormat ctermbg=261 ctermfg=188 guibg=#5d4d7a guifg=#d7d7d7
    hi LineFormatRight ctermbg=261 ctermfg=261 guibg=black guifg=#5d4d7a
    hi StatusLineinfo ctermbg=237 ctermfg=225 guibg=black guifg=#6272a4
    hi EndSeperate ctermbg=214 ctermfg=55 guibg=#fabd2f guifg=#5f00af
    hi VimMode ctermbg=black ctermfg=148 guibg=black guifg=#afd700
    hi emptySeperate1 ctermbg=237 ctermfg=black guibg=#3c3836 guifg=black
endfunction

function! s:SetStatusline()
    if s:seperate_mode ==1
        let &l:statusline=s:CustomActiveStatusLine()
        call s:CurveColor()
        return
    endif
    if s:seperate_style == 'curve'
        let &l:statusline=s:CurveActiveStatusLine()
        call s:CurveColor()
    elseif s:seperate_style == 'slant'
        let &l:statusline=s:SlantActiveStatusLine()
        call s:SlantColor()
    elseif s:seperate_style == 'arrow'
        let &l:statusline=s:ArrowActiveStatusLine()
        call s:ArrowColor()
    endif
endfunction

function! s:SetInActiveStatusLine()
    if s:seperate_mode ==1
        let &l:statusline=s:CustomInActiveStatusLine()
        call s:CurveColor()
        return
    endif
    if s:seperate_style == 'curve'
        let &l:statusline=s:CurveInActiveStatusLine()
        call s:CurveColor()
    elseif s:seperate_style == 'slant'
        let &l:statusline=s:SlantInActiveStatusLine()
        call s:SlantColor()
    elseif s:seperate_style == 'arrow'
        let &l:statusline=s:ArrowInActiveStatusLine()
        call s:ArrowColor()
    endif
endfunction

function! s:CustomActiveStatusLine()
    if &filetype ==? 'defx' || &filetype==?'vista'
        let s:statusline=""
        let s:statusline.="%#HomeMode#%{VimacslineMode()}"
        let s:statusline.="%#HomeModeRight#"
        let s:statusline.=s:homemoderight
        let s:statusline.="%#FileName#"
        let s:statusline.="%{VimacsFilenameActive()}"
        let s:statusline.="\ "
        let s:statusline.="%="
        let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
        let s:statusline.="%#EndSeperate#"
        let s:statusline.=s:EndSeperate
        return s:statusline
    endif
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    if !empty(Filesize())
        let s:statusline.="%#FileNameRight#"
        let s:statusline.=s:filenameright
        let s:statusline.="%#FileSize#"
        let s:statusline.="\ "
        let s:statusline.="%{Filesize()}"
        let s:statusline.="\ "
        let s:statusline.="%#FileSizeRight#"
        let s:statusline.="\ "
        let s:statusline.=s:filesizeright
    endif

    if !empty(VimacsLineCocError())|| !empty(VimacsLineCocWarn())||!empty(VimacslineCocFixes())
        let s:statusline.="%#HeartSymbol#"
        let s:statusline.="\ "
        let s:statusline.="%{HeartErrorSymbol()}"
        let s:statusline.="%#CocError#"
        let s:statusline.="%{VimacsLineCocError()}"
        let s:statusline.="\ "
        let s:statusline.="%#CocWarn#"
        let s:statusline.="%{VimacsLineCocWarn()}"
        let s:statusline.="\ "
    else
        let s:statusline.="%#VimMode#"
        let s:statusline.="\ "
        let s:statusline.="\["
        let s:statusline.="%{VimMode()}"
        let s:statusline.="\]"
        let s:statusline.="\ "
    endif
    if !empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#GitLeft#"
        let s:statusline.=s:gitleft
        let s:statusline.="%#GitInfo#"
        let s:statusline.="\ "
        let s:statusline.="%{VimacsLineGit()}"
        let s:statusline.="\ "
        let s:statusline.="%#GitRight#"
        let s:statusline.=s:gitright
    endif
    if !empty(expand('%:t')) && empty(get(g:,'coc_git_status','')) && &filetype != 'defx'
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    if empty(Filesize()) && empty(get(g:,'coc_git_status',''))
        let s:statusline.="%#emptySeperate1#"
        let s:statusline.=s:emptySeperate1
    endif
    let s:statusline.="%#CocBar#"
    let s:statusline.="\ "
    let s:statusline.="%{CocStatusBar()}"
    let s:statusline.="%="
    let s:statusline.="%#LineInfoLeft#"
    let s:statusline.=s:lineinfoleft
    let s:statusline.="%#StatusEncod#"
    let s:statusline.="\ "
    let s:statusline.="%{FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#StatusFileFormat#%{VimacsLineFileformat()}"
    let s:statusline.="%#LineFormatRight#"
    let s:statusline.=s:lineformatright
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction
function! s:CustomInActiveStatusLine()
    let s:statusline=""
    let s:statusline.="%#HomeMode#%{VimacslineMode()}"
    let s:statusline.="%#HomeModeRight#"
    let s:statusline.=s:homemoderight
    let s:statusline.="%#FileName#"
    let s:statusline.="%{VimacsFilenameActive()}"
    let s:statusline.="\ "
    let s:statusline.="%="
    let s:statusline.="%#StatusLineinfo#%{VimacsLineinfo()}"
    let s:statusline.="%#EndSeperate#"
    let s:statusline.=s:EndSeperate
    return s:statusline
endfunction
augroup spaceline
	autocmd!
	autocmd FileType,WinEnter,BufWinEnter,BufReadPost  * call s:SetStatusline()
    autocmd WinLeave * call s:SetInActiveStatusLine()
    autocmd BufNewFile,ShellCmdPost,BufWritePost * call s:SetStatusline()
    autocmd FileChangedShellPost,ColorScheme * call s:SetStatusline()
    autocmd FileReadPre,ShellCmdPost,FileWritePost * call s:SetStatusline()
    autocmd User CocStatusChange,CocGitStatusChange call s:SetStatusline()
    autocmd  User CocDiagnosticChange call s:SetStatusline()
augroup END "}}}
