" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
let s:symbol = get(g:, 'spaceline_line_symbol', 0)

function! spaceline#spaceline#VimacsLineGitBranch()
    if &filetype ==? 'defx'
       return ""
    endif
    if &filetype ==? 'dbui'
       return ""
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    if empty(gitbranch)
	    let gitbranch=""
        return ""
    endif
    return gitbranch
endfunction

function! s:add_diff_icon(type) abort
  let difficon = get(['','',''],a:type,'')
  let diffdata = split(get(b:, 'coc_git_status', ''),' ')
  let diff_flags = ''
  if a:type == 0
    let diff_flags = '+'
  elseif a:type == 1
    let diff_flags = '-'
  elseif a:type == 2
    let diff_flags = '\~'
  endif
  for item in diffdata
    if matchend(item,diff_flags) > 0
        if s:symbol == 1
          return item
        else
          return substitute(item, diff_flags, difficon, '').' '
        endif
    endif
  endfor
endfunction

function! spaceline#spaceline#GitDiffAdd() abort
  return s:add_diff_icon(0)
endfunction

function! spaceline#spaceline#GitDiffRemove() abort
  return s:add_diff_icon(1)
endfunction

function! spaceline#spaceline#GitDiffModified() abort
  return s:add_diff_icon(2)
endfunction

function! s:vimacsline_is_lean() abort
  return &filetype =~? '\v^defx|dbui|mundo(diff)?$'
endfunction

function! s:vimacsline_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|dbui|defx|coc-explorer|vim-plug|nerdtree|vista_kind|vista|magit|tagbar$'
endfunction

function! spaceline#spaceline#VimacsLineinfo() abort
    if s:symbol ==1
        return &filetype ==? 'help'             ? ''  :
        \      &filetype ==? 'defx'             ? ' ' :
        \      &filetype ==? 'nerdtree'         ? ' ' :
        \      &filetype ==? 'denite'           ? ' ' :
        \      &filetype ==? 'tagbar'           ? ' ' :
        \      &filetype ==? 'vim-plug'         ? ' ' :
        \      &filetype ==? 'vista'            ? ' ' :
        \      &filetype ==? 'vista_kind'       ? ' ' :
        \      &filetype ==? 'dbui'             ? ' ' :
        \      &filetype ==? 'magit'            ? ' ' :
        \      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
        \      s:vimacsline_is_lean() || s:vimacsline_is_plain() ? ' '  :
        \      printf(' %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$'))
    endif
    return &filetype ==? 'help'           ? ''  :
  \      &filetype ==? 'defx'             ? ' ' :
  \      &filetype ==? 'coc-explorer'     ? ' ' :
  \      &filetype ==? 'nerdtree'         ? ' ' :
  \      &filetype ==? 'denite'           ? ' ' :
  \      &filetype ==? 'dbui'             ? ' ' :
  \      &filetype ==? 'vista_kind'       ? ' ' :
  \      &filetype ==? 'magit'            ? ' ' :
  \      &filetype ==? 'vim-plug'         ? ' ' :
  \      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
  \      s:vimacsline_is_lean() || s:vimacsline_is_plain() ? ' '  :
  \      printf('☰ %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

function! spaceline#spaceline#Filesize()abort
  if empty(expand('%:t'))
    return ''
  endif
  if &filetype ==? 'defx'
    return ''
  endif
  if &filetype ==? 'dbui'
    return ''
  endif
  return " ".Fsize(@%)
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
  return size
endfunction

function! spaceline#spaceline#VimacslineMode() abort
    return s:vimacsline_is_lean() || s:vimacsline_is_plain() ? toupper(&filetype) : Vimacslinemode()
endfunction

function! Vimacslinemode()
  let bfnumber = s:get_buffer_number()
  let numberlist = [ '⓿ ',  '❶ ',  '➋ ',  '❸ ', '❹ ','❺ ',  '❻ ',  '❼ ',  '❽ ',  '❾ ','➓ ','⓫ ','⓬ ','⓭ ','⓮ ','⓯ ','⓰ ','⓱ ','⓲ ','⓳ ','⓴ ']
  if bfnumber == 0
    return ''
  endif
  return join([' ',numberlist[bfnumber]])
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

function! spaceline#spaceline#VimacsFilenameActive() abort
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
  if &filetype ==? 'coc-explorer'
      return ''
  endif
  if &filetype ==? 'vim-plug'
      return ''
  endif
  if &filetype ==? 'nerdtree'
      return ''
  endif
  if &filetype ==? 'defx'
      return ''
  endif
  if &filetype ==? 'dbui'
      return ''
  endif
  if &filetype ==? 'magit'
      return ''
  endif
  if empty(expand('%:t'))
    return '[No Name]'
  endif
  let mo = s:vimacsline_modified()
  let fname = VimacsLineFilename()
  let icon = winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  if s:symbol == 1
    if empty(mo)
      return fname
    else
      return fname. ''.mo
    endif
  endif
  if empty(mo)
    return icon .' '.fname
  else
    return icon .' '.fname. ''.mo
  endif
endfunction

function! VimacsLineFilename()
  return ('' != VimacsLineReadonly() ? VimacsLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '')
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


function! spaceline#spaceline#CocStatusBar() abort
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
    if &filetype ==? 'defx'
        return ""
    endif
    if &filetype ==? 'dbui'
        return ""
    endif
    if &filetype ==? 'magit'
        return ""
    endif
    if &filetype ==? 'vista'
        return ""
    endif
     return join(['❖',s])
endfunction

function! spaceline#spaceline#VimacsLineCocError()
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

function! spaceline#spaceline#VimacsLineCocWarn() abort
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


function! spaceline#spaceline#FileEncoding()
  if &filetype ==? 'defx'
    return ""
  endif
  if &filetype ==? 'dbui'
    return ""
  endif
  if &filetype ==? 'magit'
    return ""
  endif
  let l:encod = (&fenc !=# "" ? &fenc : &enc)
  return ' ' . l:encod
endfunction

function! spaceline#spaceline#VimacsLineFileformat()
  if &filetype==? 'defx'
      return ""
  endif
  if &filetype==? 'dbui'
      return ""
  endif
  if &filetype==? 'magit'
      return ''
  endif
  return winwidth(0) > 70 ? ('| '.&fileformat . ' ' ) : ''
endfunction


function! spaceline#spaceline#VimMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "🅝 "
  elseif l:mode==?"v"
    return "🅥 "
  elseif l:mode==#"i"
    return "🅘 "
  elseif l:mode==#"R"
    return "🅡 "
  elseif l:mode==?"s"
    return "🅢 "
  elseif l:mode==#"t"
    return "🅣 "
  elseif l:mode==#"c"
    return "🅒 "
  elseif l:mode==#"!"
    return "SE"
  endif
endfunction

let g:line_no_indicator_chars = [
  \ '   ', '▏  ', '▎  ', '▍  ', '▌  ',
  \ '▋  ', '▊  ', '▉  ', '█  ', '█▏ ',
  \ '█▎ ', '█▍ ', '█▌ ', '█▋ ', '█▊ ',
  \ '█▉ ', '██ ', '██▏', '██▎', '██▍',
  \ '██▌', '██▋', '██▊', '██▉', '███'
  \ ]
function! spaceline#spaceline#LineNoIndicator() abort
    " Zero index line number so 1/3 = 0, 2/3 = 0.5, and 3/3 = 1
  let l:current_line = line('.') - 1
  let l:total_lines = line('$') - 1
  let l:indicator_full_cycle_steps = len(g:line_no_indicator_chars) - 1

  " Result Line No Indicator string accumulator
  let l:result = ''

  " Iterating over repeats starting from 0 (zero)
  for l:i in range(g:line_no_indicator_bar_repeats)
    let l:line_no_fraction =
      \ ( floor(l:current_line)
      \ / floor(l:total_lines)
      \ * g:line_no_indicator_bar_repeats
      \ ) - l:i

    let l:index =
      \ min([l:indicator_full_cycle_steps,
      \ max([0,
      \ float2nr(l:line_no_fraction * l:indicator_full_cycle_steps)
      \ ])])

    let l:result = l:result . g:line_no_indicator_chars[l:index]
  endfor
  return l:result
endfunction

function! spaceline#spaceline#Setmidcolor(midcolorname)
   let s:bgcolor = synIDattr(hlID("Normal"), "bg")
   if s:bgcolor ==''
     call add(a:midcolorname,'NONE')
   else
     call add(a:midcolorname, join(split(s:bgcolor,'#'),""))
   endif
   call add(a:midcolorname, 'NONE')
endfunction

function! spaceline#spaceline#SpaceHL(group,slc,  fg, ...)
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
