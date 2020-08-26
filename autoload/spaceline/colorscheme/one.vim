" =============================================================================
" Filename: spaceline.vim
" Author: Th3Whit3Wolf
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================
function! spaceline#colorscheme#one#one()
  let s:slc={}
  let s:slc.white = ['abb2bf', 255]
  let s:slc.yellow = ['fabd2f', 214]
  let s:slc.navy = ['242B38', 237]
  let s:slc.purple = ['C678DD', 251]
  let s:slc.orange  = ['FF8800', 208]
  let s:slc.red = ['ec5f67', 203]
  let s:slc.blue = ['61AFEF', 32]
  let s:slc.lightblue = ['6272a4', 225]
  let s:slc.teal = ['008080', 6]
  let s:slc.green = ['98C379', 114] " One Dark Green
  let s:slc.cyan = ['56B6C2', 138]
  let s:slc.darkred = ['BE5046', 196]
  let s:slc.darknavy      = []

  if &background ==# 'dark'
    let s:slc.gray = ['3e4452', 237]
    let s:slc.lightgray = ['282c34', 240]
    let s:slc.darknavy=['2c323d', 59]
    let s:slc.darkgray=['abb2bf', 145]
  else
    let s:slc.gray = ['d0d0d0', 237]
    let s:slc.lightgray = ['fafafa', 240]
    let s:slc.darknavy=['f0f0f0', 59]
    let s:slc.darkgray=['494b53', 238]
  endif

  call spaceline#colors#match_background_color(s:slc.darknavy)

  let l:mode=mode()
  if g:seperate_style  == 'slant'
      call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
      if empty(expand('%t'))
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'gray')
      else
        call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'green')
      endif
      call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','green')
      call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'green','gray')
      call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
      call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'green')
      call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'blue', 'gray')
      call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'blue', 'darknavy')
  elseif g:seperate_style == 'slant-cons'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'green')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'green',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'slant-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'green')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','green')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'green','darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style == 'arrow-fade'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'blue', 'green')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'green',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'gray', 'darknavy')
  elseif g:seperate_style  == 'curve'
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'green', 'blue')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','green')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'green',  'darknavy')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'gray')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'darknavy', 'gray')
  else
    call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'green', 'blue')
    call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'green','gray')
    call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'gray','green')
    call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'gray',  'green')
    call spaceline#colors#spaceline_hl('GitRight',s:slc,  'darknavy',  'green')
    call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'gray', 'blue')
    call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'darknavy', 'blue')
  endif

  call spaceline#colors#spaceline_hl('InActiveFilename', s:slc, 'lightgray', 'gray')
  call spaceline#colors#spaceline_hl('FileName', s:slc, 'lightgray', 'green')
  call spaceline#colors#spaceline_hl('Filesize', s:slc, 'purple', 'gray')
  call spaceline#colors#spaceline_hl('HeartSymbol', s:slc, 'orange',  'gray')
  call spaceline#colors#spaceline_hl('CocError',s:slc,  'red',  'gray')
  call spaceline#colors#spaceline_hl('CocWarn',s:slc,  'yellow',  'gray')
  call spaceline#colors#spaceline_hl('GitBranchIcon', s:slc, 'orange',  'green')
  call spaceline#colors#spaceline_hl('GitInfo',s:slc,  'lightgray',  'green')
  call spaceline#colors#spaceline_hl('GitAdd',s:slc,  'purple',  'green') " purple ok
  call spaceline#colors#spaceline_hl('GitRemove',s:slc,  'red',  'green')
  call spaceline#colors#spaceline_hl('GitModified',s:slc,  'orange',  'green')
  call spaceline#colors#spaceline_hl('CocBar',s:slc,  'teal',  'darknavy')
  if g:seperate_style == 'slant'
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'darknavy',  'green')
  else
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'green',  'darknavy')
  endif
  if g:seperate_style == 'arrow-fade' || g:seperate_style == 'slant-cons' || g:seperate_style == 'slant'
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'green')
  else
      call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'green',  'gray')
  endif
  call spaceline#colors#spaceline_hl('StatusEncod',s:slc,  'lightgray',  'green')
  call spaceline#colors#spaceline_hl('StatusFileFormat',s:slc,  'lightgray',  'green')
  call spaceline#colors#spaceline_hl('StatusLineinfo',s:slc,  'darkgray',  'gray')
  call spaceline#colors#spaceline_hl('EndSeperate',s:slc,  'blue',  'green')
  call spaceline#colors#spaceline_hl('emptySeperate1',s:slc,  'gray',  'darknavy')
endfunction
