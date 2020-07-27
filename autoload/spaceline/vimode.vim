" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#vimode#vim_mode()
  let status={}
  if exists('g:spaceline_custom_vim_status')
    let status = get(g:,'spaceline_custom_vim_status')
  else
    let status = {'n': "🅝 ",'v':"🅥 ",'i':"🅘 ",'R':"🅡 ",'s':"🅢 ",'t':"🅣 ",'c':"🅒 ","!":"SE"}
  endif
  return status[mode()]
endfunction
