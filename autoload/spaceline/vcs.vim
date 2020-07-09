" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
"
function! spaceline#vcs#git_branch()
  let l:gitbranch = get(g:, 'coc_git_status', '')
  if empty(l:gitbranch)
    return ""
  endif
  if exists('l:git_branch_icon')
    return l:git_branch_icon . l:gitbranch
  endif
  return l:gitbranch
endfunction

function! s:add_diff_icon(type) abort
  let l:difficon = get(['','',''],a:type,'')
  let l:diffdata=[]
  if g:spaceline_git ==? 'coc'
    let l:diffdata = split(get(b:, 'coc_git_status', ''),' ')
  elseif g:spaceline_git ==? 'default'
    let l:diffdata = spaceline#vcs#diff_calculate(bufnr('%'))
  endif
  let l:diff_flags = ''
  if a:type == 0
    let l:diff_flags = '+'
  elseif a:type == 1
    let l:diff_flags = '-'
  elseif a:type == 2
    let l:diff_flags = '\~'
  endif
  for item in l:diffdata
    if matchend(item,l:diff_flags) > 0
        if g:symbol == 1
          return item
        else
          return substitute(item, l:diff_flags, l:difficon, '').' '
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

" reference
" https://github.com/niklaas/lightline-gitdiff/blob/master/autoload/lightline/gitdiff/algorithms/word_diff_porcelain.vim
function! spaceline#vcs#diff_calculate(buffer) abort
  if !spaceline#utils#is_git_exectuable() || !spaceline#utils#is_inside_work_tree(a:buffer)
    " b/c there is nothing that can be done here; the algorithm needs git
    return []
  endif

  let l:indicator_groups = s:transcode_diff_porcelain(s:get_diff_porcelain(a:buffer))

  let l:changes = map(copy(l:indicator_groups), { idx, val ->
        \ s:parse_indicator_group(val) })

  let l:lines_added = len(filter(copy(l:changes), { idx, val -> val ==# 'A' }))
  let l:lines_deleted = len(filter(copy(l:changes), { idx, val -> val ==# 'D' }))
  let l:lines_modified = len(filter(copy(l:changes), { idx, val -> val ==# 'M' }))

  let l:diff_status=[]
  if l:lines_added > 0
    call add(l:diff_status, "+".l:lines_added)
  endif
  if l:lines_deleted > 0
    call add(l:diff_status, "-".l:lines_deleted)
  endif
  if l:lines_modified > 0
    call add(l:diff_status, "~".l:lines_modified)
  endif

  return l:diff_status
endfunction

function! s:get_diff_porcelain(buffer) abort
  let l:porcelain = systemlist('cd ' . expand('#' . a:buffer . ':p:h:S') .
        \ ' && git diff --no-ext-diff --word-diff=porcelain --unified=0 -- ' . expand('#' . a:buffer . ':t:S'))
  return l:porcelain[4:]
endfunction

function! s:transcode_diff_porcelain(porcelain) abort
  " b/c we do not need the line identifiers
  call filter(a:porcelain, { idx, val -> val !~# '^@@' })

  " b/c we only need the identifiers at the first char of each diff line
  call map(a:porcelain, { idx, val -> strcharpart(val, -1, 2) })

  return spaceline#utils#group_at({ el -> el ==# '~' }, a:porcelain, v:true)
endfunction

function! s:parse_indicator_group(indicators) abort
  let l:changer = ''

  if len(a:indicators) ==# 1 && a:indicators[0] ==# '~'
    return 'A'
  endif

  for el in a:indicators
    if l:changer ==# '' && ( el ==# '-' || el ==# '+' )
      let l:changer = el
      continue
    endif

    if l:changer ==# '+' && el ==# '~'
      return 'A'
    endif

    if l:changer ==# '-' && el ==# '~'
      return 'D'
    endif

    if l:changer !=# el
      return 'M'
    endif
  endfor

  " b/c we should never end up here
  echoerr 'spaceline#vcs: Error parsing indicator group: [ ' . join(a:indicators, ', ') . ' ]'
endfunction
