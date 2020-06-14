" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#file#file_type() abort
  return &filetype ==? 'help'             ? '  '  :
  \      &filetype ==? 'defx'             ? '  ' :
  \      &filetype ==? 'nerdtree'         ? '  ' :
  \      &filetype ==? 'denite'           ? '  ' :
  \      &filetype ==? 'tagbar'           ? '  ' :
  \      &filetype ==? 'vim-plug'         ? '  ' :
  \      &filetype ==? 'vista'            ? '  ' :
  \      &filetype ==? 'vista_kind'       ? '  ' :
  \      &filetype ==? 'dbui'             ? '  ' :
  \      &filetype ==? 'magit'            ? '  ' :
  \      &filetype =~? '\v^mundo(diff)?$' ? '  ' :
  \      s:line_is_lean() || s:line_is_plain() ? ' '  :
  \      printf(' %d:%d %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction

function! spaceline#file#file_size()abort
  if empty(expand('%:t'))
    return ''
  endif
  return ' '.s:size(@%)
endfunction

function! spaceline#file#file_name() abort
  if empty(expand('%:t'))
    return '[No Name]'
  endif
  if index(g:spaceline_shortline_filetype, &filetype) >= 0
    return ''
  endif
  let mo = s:file_is_modified()
  let fname = s:current_file_name()
  let icon = winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  if g:symbol == 1
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

function! spaceline#file#file_encode()
  let l:encode = (&fenc !=# "" ? &fenc : &enc)
  return ' ' . l:encode
endfunction

function! spaceline#file#file_format()
  return winwidth(0) > 70 ? ('| '.&fileformat . ' ' ) : ''
endfunction

function! s:current_file_name()
  return ('' != s:file_readonly() ? s:file_readonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '')
endfunction

function! s:file_is_modified() abort
  return s:line_is_lean() || s:line_is_plain() ?  ''  :
  \      &modified                                       ?  '' :
  \      &modifiable                                     ?  ''  : '-'
endfunction

function! s:file_readonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! s:line_is_lean() abort
  return &filetype =~? '\v^defx|dbui|mundo(diff)?$'
endfunction

function! s:line_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|dbui|defx|coc-explorer|vim-plug|nerdtree|vista_kind|vista|magit|tagbar$'
endfunction


function! s:size(f) abort
    let l:size = getfsize(expand(a:f))
  if l:size == 0 || l:size == -1 || l:size == -2
    return ''
  endif
  if l:size < 1024
    let size = l:size.'b'
  elseif l:size < 1024*1024
    let size = printf('%.1f', l:size/1024.0).'k'
  elseif l:size < 1024*1024*1024
    let size = printf('%.1f', l:size/1024.0/1024.0) . 'm'
  else
    let size = printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
  endif
  return size
endfunction
