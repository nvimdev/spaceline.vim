" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

" Determine whether the current lsp is coc or nvim-lsp
function! spaceline#diagnostic#diagnostic_error()
  let l:error_message = s:diagnostic_{g:spaceline_lsp}_error()
  return l:error_message
endfunction

function! spaceline#diagnostic#diagnostic_warn()
  let l:warn_message = s:diagnostic_{g:spaceline_lsp}_warn()
  return l:warn_message
endfunction

function! s:diagnostic_coc_error()
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

function! s:diagnostic_coc_warn() abort
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

function! s:coc_quickfixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction

" TODO test
function! s:diagnostic_nvim_lsp_error()
  let l:error_sign= exists('g:spaceline_nvim_lsp_errorsign')? g:spaceline_nvim_lsp_errorsign : '●'
  if luaeval('#vim.lsp.buf_get_clients(0) ~= 0')
    return l:error_sign. luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  else
    return ''
  endif
endfunction

" TODO test
function! s:diagnostic_nvim_lsp_warn()
  let l:warn_sign= exists('g:spaceline_nvim_lsp_warnsign')? g:spaceline_nvim_lsp_warnsign : '●'
  if luaeval('#vim.lsp.buf_get_clients(0) ~= 0')
    return l:warn_sign. luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  else
    return ''
  endif
endfunction

