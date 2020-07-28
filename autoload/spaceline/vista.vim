let s:fn_icon = exists('g:spaceline_function_icon') ? get(g:, 'spaceline_function_icon', "") : ''

function! spaceline#vista#vista_nearest() abort
  return !empty(get(b:, 'vista_nearest_method_or_function', '')) ? s:fn_icon. b:vista_nearest_method_or_function : ''
endfunction
