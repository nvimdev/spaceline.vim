" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
scriptencoding utf-8
if exists('g:loaded_spaceline') || v:version < 700
  finish
endif
let g:loaded_spaceline = 1

let g:seperate_style = get(g:, 'spaceline_seperate_style', 'arrow')
let g:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let g:spaceline_shortline_filetype = ['defx','coc-explorer','dbui','vista','vista_markdown']
let g:spaceline_scroll_bar_chars = get(g:,'spaceline_scroll_bar_chars', [
  \  '▁', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ])

let g:sep= {}
let g:sep = spaceline#seperator#spacelineStyle(g:seperate_style)


augroup spaceline
  autocmd!
  autocmd FileType,WinEnter,BufWinEnter,BufReadPost * call spaceline#drawer#spacelinetoggle()
  autocmd VimResized * call spaceline#drawer#spacelinetoggle()
  autocmd WinLeave * call spaceline#drawer#setInActiveStatusLine()
  autocmd BufNewFile,ShellCmdPost,BufWritePost * call spaceline#drawer#spacelinetoggle()
  autocmd FileChangedShellPost,ColorScheme * call spaceline#drawer#spacelinetoggle()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call spaceline#drawer#spacelinetoggle()
  autocmd User CocStatusChange,CocGitStatusChange,ClapOnExit call spaceline#drawer#spacelinetoggle()
  autocmd User CocDiagnosticChange call spaceline#drawer#spacelinetoggle()
augroup END "}}}
