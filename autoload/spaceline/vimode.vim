" =============================================================================
" Filename: spaceline.vim
" Author: glepnir
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#vimode#vim_mode()
  let status= exists('g:spaceline_custom_vim_status') ? get(g:,'spaceline_custom_vim_status') : {"n": "🅝  ","V":"🅥  ","v":"🅥  ","\<C-v>": "🅥  ","i":"🅘  ","R":"🅡  ","r":"🅡  ","s":"🅢  ","t":"🅣  ","c":"🅒  ","!":"SE "}
  return status[mode()]
endfunction
