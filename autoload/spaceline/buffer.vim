" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#buffer#buffer() abort
    return s:line_is_lean() || s:line_is_plain() ? toupper(&filetype) : s:buffer_number()
endfunction

function! s:line_is_lean() abort
  return &filetype =~? '\v^defx|dbui|mundo(diff)?$'
endfunction

function! s:line_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|dbui|defx|coc-explorer|vim-plug|nerdtree|vista_kind|vista|magit|tagbar$'
endfunction

function! s:buffer_number()
  let bfnumber = s:get_buffer_number()
  let numberlist = [ '⓿ ',  '❶ ',  '➋ ',  '❸ ', '❹ ','❺ ',  '❻ ',  '❼ ',  '❽ ',  '❾ ','➓ ','⓫ ','⓬ ','⓭ ','⓮ ','⓯ ','⓰ ','⓱ ','⓲ ','⓳ ','⓴ ','㉑', '㉒', '㉓' ,'㉔', '㉕','㉖','㉗','㉘','㉙','㉚','㉛','㉜','㉝','㉞','㉟','㊱','㊲','㊳','㊴','㊵','㊶','㊷','㊸','㊹','㊺','㊻','㊼','㊽','㊾','㊿']
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

