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
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, g:spaceline_errorsign . info['error'])
  endif
  return join(errmsgs, ' ')
endfunction

function! s:diagnostic_coc_warn() abort
  let warning_sign = get(g:, 'spaceline_diagnostic_warnsign','')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, g:spaceline_warnsign . info['warning'])
  endif
 return join(warnmsgs, ' ')
endfunction

function! s:coc_quickfixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction

" TODO test
function! s:diagnostic_nvim_lsp_error()
  if luaeval('#vim.lsp.buf_get_clients(0) ~= 0')
    return g:spaceline_errorsign. luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  else
    return ''
  endif
endfunction

" TODO test
function! s:diagnostic_nvim_lsp_warn()
  if luaeval('#vim.lsp.buf_get_clients(0) ~= 0')
    return g:spaceline_warnsign. luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
  else
    return ''
  endif
endfunction

function! s:diagnostic_nvim_ale_warn() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : g:spaceline_warnsign . l:all_non_errors
endfunction

function! s:diagnostic_nvim_ale_error() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : g:spaceline_errorsign . l:all_errors
endfunction
