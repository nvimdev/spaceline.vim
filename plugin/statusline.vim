" =============================================================================
" Filename: spaceline.vim
" Author: glepnir
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================

scriptencoding utf-8
if exists('g:loaded_spaceline') || v:version < 700
  finish
endif

let g:loaded_spaceline = 1

let g:seperate_style = get(g:, 'spaceline_seperate_style', 'slant')
let g:spaceline_colorscheme = get(g:, 'spaceline_colorscheme', 'space')
let g:spaceline_shortline_filetype = ['defx','coc-explorer','dbui','vista','vista_markdown','Mundo','MundoDiff','LuaTree']
let g:spaceline_scroll_bar_chars = get(g:,'spaceline_scroll_bar_chars', [
  \  '▁', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ])

let g:spaceline_diagnostic = get(g:,'spaceline_diagnostic_tool','coc')
let g:spaceline_diff = get(g:,'spaceline_diff_tool','coc')

let g:spaceline_errorsign = get(g:,'spaceline_diagnostic_errorsign', '●')
let g:spaceline_warnsign = get(g:,'spaceline_diagnostic_warnsign', '●')
let g:spaceline_oksign = get(g:,'spaceline_diagnostic_oksign', '')

let g:spaceline_branch_icon = get(g:,'spaceline_git_branch_icon','')
let g:spaceline_diff_icon = get(g:,'spaceline_custom_diff_icon', ['','',''])
let g:spaceline_funcicon = get(g:,'spaceline_function_icon','')


let g:sep= {}
let g:sep = spaceline#seperator#spacelineStyle(g:seperate_style)


augroup spaceline
  autocmd!
  autocmd BufNewFile,BufReadPost * call spaceline#vcs#gitbranch_detect(expand('<amatch>:p:h'))
  autocmd BufEnter * call spaceline#vcs#gitbranch_detect(expand('%:p:h'))
  autocmd FileType,BufWinEnter,BufReadPost,BufWritePost * call spaceline#spacelinetoggle()
  autocmd BufEnter,WinEnter,BufEnter,FileChangedShellPost  * call spaceline#spacelinetoggle()
  autocmd Colorscheme * call spaceline#colorscheme_init()
  autocmd VimResized * call spaceline#spacelinetoggle()
  autocmd WinLeave * call spaceline#setInActiveStatusLine()
  autocmd User CocStatusChange,CocGitStatusChange,ClapOnExit,GitGutter,Signify call spaceline#spacelinetoggle()
  autocmd User CocDiagnosticChange call spaceline#spacelinetoggle()
augroup END "}}}
