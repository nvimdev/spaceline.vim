" =============================================================================
" Filename: spaceline.vim
" Author: glepnir
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================
let s:add = 0
let s:change = 0
let s:delete = 0

function! spaceline#vcs#git_branch_icon()
  return g:spaceline_branch_icon
endfunction

" reference https://github.com/itchyny/vim-gitbranch/blob/master/plugin/gitbranch.vim
function! spaceline#vcs#git_branch() abort
  if get(b:, 'gitbranch_pwd', '') !=# expand('%:p:h') || !has_key(b:, 'gitbranch_path')
    call spaceline#vcs#gitbranch_detect(expand('%:p:h'))
  endif
  if has_key(b:, 'gitbranch_path') && filereadable(b:gitbranch_path)
    let branch = get(readfile(b:gitbranch_path), 0, '')
    if branch =~# '^ref: '
      return ' '. substitute(branch, '^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=', '', '')
    elseif branch =~# '^\x\{20\}'
      return ' '. branch[:6]
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

function! s:get_hunks_gitgutter()
  let [a,m,r] = GitGutterGetHunkSummary()
  return ['+'.a,'~'.m,'-'.r]
endfunction

function! s:get_hunks_signify()
  let [add,change,delete] = sy#repo#get_stats()
  return ['+'.add,'~'.change,'-'.delete]
endfunction

function! s:add_diff_icon(type) abort
  let l:difficon = g:spaceline_diff_icon[a:type]
  let l:diff_data = []
  let l:diff_flags = ['+','\~','-'][a:type]
  if g:spaceline_diff == 'coc-git'
    let l:diff_data = split(get(b:, 'coc_git_status', ''),' ')
  elseif g:spaceline_diff == 'vim-signify'
    let l:diff_data = s:get_hunks_signify()
  elseif g:spaceline_diff == 'git-gutter'
    let l:diff_data = s:get_hunks_gitgutter()
  end
  for item in l:diff_data
    if matchend(item,l:diff_flags) > 0
      return substitute(item, l:diff_flags, l:difficon, '').' '
    endif
  endfor
endfunction

function! spaceline#vcs#diff_add() abort
  return s:add_diff_icon(0)
endfunction

function! spaceline#vcs#diff_modified() abort
  return s:add_diff_icon(1)
endfunction

function! spaceline#vcs#diff_remove() abort
  return s:add_diff_icon(2)
endfunction

function! spaceline#vcs#check_diff_empty(type)
  let l:stats = {'add':0,'modified':1,'remove':2}[a:type]
  if g:spaceline_diff == 'git-gutter'
    return GitGutterGetHunkSummary()[l:stats] != 0
  elseif g:spaceline_diff == 'vim-signify'
    return sy#repo#get_stats()[l:stats] > 0
  else
    return !empty(spaceline#vcs#diff_{a:type}())
  end
endfunction
