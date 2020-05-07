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

let g:line_no_indicator_bar_repeats = get(g:,'line_no_indicator_bar_repeats',1)
let g:seperate_mode = get(g:, 'spaceline_seperate_mode', 0)
let g:seperate_style = get(g:, 'spaceline_seperate_style', 'arrow')
let g:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let g:sep= {}
if g:seperate_style ==1
        let g:sep = spaceline#seperator#spacelineCustomSeperate()
  else
        let g:sep = spaceline#seperator#spacelineStyle(g:seperate_style)
endif


augroup spaceline
  autocmd!
  autocmd FileType,WinEnter,BufWinEnter,BufReadPost * call spaceline#drawer#spacelinetoggle()
  autocmd VimResized * call spaceline#drawer#spacelinetoggle()
  autocmd WinLeave * call spaceline#drawer#setInActiveStatusLine()
  autocmd BufNewFile,ShellCmdPost,BufWritePost * call spaceline#drawer#spacelinetoggle()
  autocmd FileChangedShellPost,ColorScheme * call spaceline#drawer#spacelinetoggle()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call spaceline#drawer#spacelinetoggle()
  autocmd User CocStatusChange,CocGitStatusChange call spaceline#drawer#spacelinetoggle()
  autocmd User CocDiagnosticChange call spaceline#drawer#spacelinetoggle()
augroup END "}}}
