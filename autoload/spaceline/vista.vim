
function! spaceline#vista#vista_nearest() abort
  return !empty(get(b:, 'vista_nearest_method_or_function', '')) ? g:spaceline_funcicon. b:vista_nearest_method_or_function.' ' : ''
endfunction
