
function! spaceline#utils#line_is_lean() abort
  return &filetype =~? '\v^defx|dbui|mundo(diff)?$'
endfunction

function! spaceline#utils#line_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|dbui|defx|coc-explorer|vim-plug|nerdtree|vista_kind|vista|magit|tagbar$'
endfunction

function! spaceline#utils#group_at(f, list, borders) abort
  " for the first element this must be true to initialise the list with an
  " empty group at the beginning (if it's not a border that should be
  " excluded)
  let l:is_previous_border = v:true
  let l:grouped_list = []

  for el in a:list
    " element matches but not borders should be included
    let l:skip_this = a:f(el) && !a:borders

    if l:is_previous_border && !l:skip_this
      call add(l:grouped_list, [])
    endif

    let l:is_previous_border = a:f(el) ? v:true : v:false

    if l:skip_this
      continue
    endif

    call add(l:grouped_list[len(l:grouped_list)-1], el)
  endfor

  return l:grouped_list
endfunction

function! spaceline#utils#is_inside_work_tree(buffer) abort "{{{1
  call system('cd ' . expand('#' . a:buffer . ':p:h:S') . ' && git rev-parse --is-inside-work-tree --prefix ' . expand('#' . a:buffer . ':h:S'))
  return !v:shell_error
endfunction

function! spaceline#utils#is_git_exectuable() abort "{{{1
  return executable('git')
endfunction
