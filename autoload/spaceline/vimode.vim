" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#vimode#vim_mode()
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
