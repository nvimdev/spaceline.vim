" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#vcs#git_branch()
    let gitbranch=get(g:, 'coc_git_status', '')
    if empty(gitbranch)
	    let gitbranch=""
        return ""
    endif
    return gitbranch
endfunction

function! s:add_diff_icon(type) abort
  let difficon = get(['','',''],a:type,'')
  let diffdata = split(get(b:, 'coc_git_status', ''),' ')
  let diff_flags = ''
  if a:type == 0
    let diff_flags = '+'
  elseif a:type == 1
    let diff_flags = '-'
  elseif a:type == 2
    let diff_flags = '\~'
  endif
  for item in diffdata
    if matchend(item,diff_flags) > 0
        if g:symbol == 1
          return item
        else
          return substitute(item, diff_flags, difficon, '').' '
        endif
    endif
  endfor
endfunction

function! spaceline#vcs#diff_add() abort
  return s:add_diff_icon(0)
endfunction

function! spaceline#vcs#diff_remove() abort
  return s:add_diff_icon(1)
endfunction

function! spaceline#vcs#diff_modified() abort
  return s:add_diff_icon(2)
endfunction
