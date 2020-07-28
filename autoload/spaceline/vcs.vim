" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================

" reference https://github.com/itchyny/vim-gitbranch/blob/master/plugin/gitbranch.vim
function! spaceline#vcs#git_branch() abort
  let git_branch_icon = exists('g:spaceline_git_branch_icon') ? get(g:,'spaceline_git_branch_icon') : ''
  if get(b:, 'gitbranch_pwd', '') !=# expand('%:p:h') || !has_key(b:, 'gitbranch_path')
    call spaceline#vcs#gitbranch_detect(expand('%:p:h'))
  endif
  if has_key(b:, 'gitbranch_path') && filereadable(b:gitbranch_path)
    let branch = get(readfile(b:gitbranch_path), 0, '')
    if branch =~# '^ref: '
      return git_branch_icon .' '. substitute(branch, '^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=', '', '')
    elseif branch =~# '^\x\{20\}'
      return git_branch_icon .' '. branch[:6]
    endif
  endif
  return ''
endfunction

function! s:gitbranch_dir(path) abort
  let path = a:path
  let prev = ''
  while path !=# prev
    let dir = path . '/.git'
    let type = getftype(dir)
    if type ==# 'dir' && isdirectory(dir.'/objects') && isdirectory(dir.'/refs') && getfsize(dir.'/HEAD') > 10
      return dir
    elseif type ==# 'file'
      let reldir = get(readfile(dir), 0, '')
      if reldir =~# '^gitdir: '
        return simplify(path . '/' . reldir[8:])
      endif
    endif
    let prev = path
    let path = fnamemodify(path, ':h')
  endwhile
  return ''
endfunction

function! spaceline#vcs#gitbranch_detect(path) abort
  unlet! b:gitbranch_path
  let b:gitbranch_pwd = expand('%:p:h')
  let dir = s:gitbranch_dir(a:path)
  if dir !=# ''
    let path = dir . '/HEAD'
    if filereadable(path)
      let b:gitbranch_path = path
    endif
  endif
endfunction

function! s:add_diff_icon(type) abort
  let diff_nerdfonts_icon = exists('g:spaceline_custom_diff_icon') ? get(g:,'spaceline_custom_diff_icon'): ['','','']
  let difficon = get(diff_nerdfonts_icon,a:type,'')
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
