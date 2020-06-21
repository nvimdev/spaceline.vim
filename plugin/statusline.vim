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

let g:symbol = get(g:, 'spaceline_line_symbol', 0)
let g:seperate_style = get(g:, 'spaceline_seperate_style', 'arrow')
let g:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let g:spaceline_shortline_filetype = ['defx','coc-explorer','dbui','vista','vista_markdown','Mundo','MundoDiff']
let g:spaceline_scroll_bar_chars = get(g:,'spaceline_scroll_bar_chars', [
  \  '▁', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ])
let g:spaceline_lsp = get(g:,'spaceline_lsp_executive','coc')
let g:spaceline_git = get(g:,'spaceline_git_tool','coc')

let g:sep= {}
let g:sep = spaceline#seperator#spacelineStyle(g:seperate_style)


augroup spaceline
  autocmd!
  autocmd FileType,WinEnter,BufWinEnter,BufReadPost * call spaceline#spacelinetoggle()
  autocmd VimResized * call spaceline#spacelinetoggle()
  autocmd WinLeave * call spaceline#setInActiveStatusLine()
  autocmd BufNewFile,ShellCmdPost,BufWritePost * call spaceline#spacelinetoggle()
  autocmd FileChangedShellPost,ColorScheme * call spaceline#spacelinetoggle()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call spaceline#spacelinetoggle()
  autocmd User CocStatusChange,CocGitStatusChange,ClapOnExit call spaceline#spacelinetoggle()
  autocmd User CocDiagnosticChange call spaceline#spacelinetoggle()
augroup END "}}}
