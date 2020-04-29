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

let s:seperate_mode = get(g:, 'spaceline_seperate_mode', 0)
let s:seperate_style = get(g:, 'spaceline_seperate_style', 'arrow')
let s:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let s:sep= {}
if s:seperate_style ==1
        let s:sep = spaceline#seperator#spacelineCustomSeperate()
  else
        let s:sep = spaceline#seperator#spacelineStyle(s:seperate_style)
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
