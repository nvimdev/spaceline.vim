" =============================================================================
" Filename: spaceline.vim
" Author: FollieHiyuki
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================
function! spaceline#colorscheme#srcery#srcery()
  let s:slc={}
  let s:slc.white     = ['d0bfa1', 7]
  let s:slc.gray      = ['262626', 235]
  let s:slc.gray2      = ['303030', 236]
  let s:slc.gray3      = ['3a3a3a', 237]
  let s:slc.gray4      = ['444444', 238]
  let s:slc.gray5      = ['4e4e4e', 239]
  let s:slc.gray6      = ['585858', 240]
  let s:slc.black     = ['1c1b19', 0]
  let s:slc.yellow    = ['fbb829', 3]
  let s:slc.purple    = ['e02c6d', 5]
  let s:slc.orange    = ['ff5f00', 202]
  let s:slc.red       = ['ef2f27', 1]
  let s:slc.blue      = ['2c78bf', 4]
  let s:slc.cyan      = ['0aaeb3', 6]
  let s:slc.darknavy  = ['262626', 235]

  call spaceline#colors#match_background_color(s:slc.darknavy)

  let l:mode=mode()
  if g:seperate_style  == 'slant'
      call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
      if empty(expand('%t'))
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
      else
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
      endif
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray3')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'gray3')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style == 'slant-cons'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray3','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray3',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'slant-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','gray3')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray3',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style == 'arrow-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray5', 'gray3')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray3','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray3',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'curve'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray3', 'gray5')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray3','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'gray3',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  else
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'white', 'gray5')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'gray3', 'gray5')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray3','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'gray3')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'gray3')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  endif

  call spaceline#colors#spaceline_hl('InActiveFilename', s:slc, 'cyan', 'gray')
  call spaceline#colors#spaceline_hl('FileName', s:slc, 'white', 'gray3')
  call spaceline#colors#spaceline_hl('Filesize', s:slc, 'purple', 'gray')
  call spaceline#colors#spaceline_hl('HeartSymbol', s:slc, 'orange',  'gray')
  call spaceline#colors#spaceline_hl('CocError',s:slc,  'red',  'gray')
  call spaceline#colors#spaceline_hl('CocWarn',s:slc,  'yellow',  'gray')
  call spaceline#colors#spaceline_hl('GitBranchIcon', s:slc, 'orange',  'gray3')
  call spaceline#colors#spaceline_hl('GitInfo',s:slc,  'white',  'gray3')
  call spaceline#colors#spaceline_hl('GitAdd',s:slc,  'purple',  'cyan')
  call spaceline#colors#spaceline_hl('GitRemove',s:slc,  'red',  'cyan')
  call spaceline#colors#spaceline_hl('GitModified',s:slc,  'orange',  'cyan')
  call spaceline#colors#spaceline_hl('CocBar',s:slc,  'cyan',  'darknavy')
  if g:seperate_style == 'slant'
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'darknavy',  'gray3')
  else
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'gray3',  'darknavy')
  endif
  if g:seperate_style == 'arrow-fade' || g:seperate_style == 'slant-cons' || g:seperate_style == 'slant'
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'gray3')
  else
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray3',  'gray')
  endif
  call spaceline#colors#spaceline_hl('StatusEncod',s:slc,  'white',  'gray3')
  call spaceline#colors#spaceline_hl('StatusFileFormat',s:slc,  'white',  'gray3')
  call spaceline#colors#spaceline_hl('StatusLineinfo',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('EndSeperate',s:slc,  'blue',  'gray3')
  call spaceline#colors#spaceline_hl('emptySeperate1',s:slc,  'gray',  'darknavy')
endfunction
