
function! spaceline#utils#line_is_lean() abort
  return &filetype =~? '\v^defx|dbui|chadtree|mundo(diff)?$'
endfunction

function! spaceline#utils#line_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|dbui|defx|chadtree|coc-explorer|vim-plug|nerdtree|vista_kind|vista|magit|tagbar$'
endfunction


