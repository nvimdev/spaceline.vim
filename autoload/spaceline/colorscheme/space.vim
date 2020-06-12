" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
let s:slc={}
let s:slc.yellow = ['fabd2f', 214]
let s:slc.navy = ['242B38', 237]
let s:slc.lightgray= ['c0c0c0', 188]
let s:slc.purple = ['5d4d7a', 261]
let s:slc.orange  = ['FF8800', 208]
let s:slc.red = ['ec5f67', 203]
let s:slc.blue = ['0087d7', 32]
let s:slc.lightblue = ['6272a4', 225]
let s:slc.teal = ['008080', 6]
let s:slc.green = ['afd700', 148]
let s:slc.gray = ['3c3836', 237]
let s:slc.darknavy=[]

call spaceline#spaceline#Setmidcolor(s:slc.darknavy)

function! spaceline#colorscheme#space#space()
  let l:mode=mode()
  if get(g:,'spaceline_seperate_style', 'arrow') == 'slant'
      call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
      call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'yellow', 'purple')
      call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'navy','purple')
      call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'purple','navy')
      call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'purple',  'navy')
      call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'purple',  'darknavy')
      call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'yellow', 'navy')
      call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'yellow', 'navy')
  elseif get(g:,'spaceline_seperate_style','arrow') == 'slant-cons'
    if l:mode==#"n"
      call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
      call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'yellow', 'purple')
    elseif l:mode==#"i"
      call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'navy', 'green')
      call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'green', 'purple')
    endif

    call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'purple',  'darknavy')
    call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'yellow', 'navy')
    call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'yellow', 'navy')
  elseif get(g:,'spaceline_seperate_style','arrow') == 'slant-fade'
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
    call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'yellow', 'purple')
    call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'navy','purple')
    call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'purple','darknavy')
    call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'yellow', 'navy')
    call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'yellow', 'navy')
  elseif get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade'
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
    call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'yellow', 'purple')
    call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'purple',  'darknavy')
    call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'yellow', 'navy')
    call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'yellow', 'navy')
  elseif get(g:,'spaceline_seperate_style', 'arrow') == 'curve'
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
    call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'purple', 'yellow')
    call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'navy','purple')
    call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'purple',  'darknavy')
    call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'navy', 'yellow')
    call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'navy', 'yellow')
  else
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'teal', 'yellow')
    call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'purple', 'yellow')
    call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'purple','navy')
    call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'navy','purple')
    call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('GitRight',s:slc,  'navy',  'purple')
    call spaceline#spaceline#SpaceHL('InActiveHomeRight', s:slc, 'navy', 'yellow')
    call spaceline#spaceline#SpaceHL('ShortRight', s:slc, 'navy', 'yellow')
  endif

  call spaceline#spaceline#SpaceHL('InActiveFilename', s:slc, 'lightgray', 'navy')
  call spaceline#spaceline#SpaceHL('FileName', s:slc, 'lightgray', 'purple')
  call spaceline#spaceline#SpaceHL('Filesize', s:slc, 'lightblue', 'navy')
  call spaceline#spaceline#SpaceHL('HeartSymbol', s:slc, 'orange',  'navy')
  call spaceline#spaceline#SpaceHL('CocError',s:slc,  'red',  'navy')
  call spaceline#spaceline#SpaceHL('CocWarn',s:slc,  'blue',  'navy')
  call spaceline#spaceline#SpaceHL('GitInfo',s:slc,  'lightgray',  'purple')
  call spaceline#spaceline#SpaceHL('GitAdd',s:slc,  'green',  'purple')
  call spaceline#spaceline#SpaceHL('GitRemove',s:slc,  'red',  'purple')
  call spaceline#spaceline#SpaceHL('GitModified',s:slc,  'orange',  'purple')
  call spaceline#spaceline#SpaceHL('CocBar',s:slc,  'teal',  'darknavy')
  call spaceline#spaceline#SpaceHL('LineInfoLeft',s:slc,  'purple',  'darknavy')
  if get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade' || get(g:,'spaceline_seperate_style','arrow') == 'slant-cons'
      call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'navy',  'purple')
  else
      call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'purple',  'navy')
  endif
  call spaceline#spaceline#SpaceHL('StatusEncod',s:slc,  'lightgray',  'purple')
  call spaceline#spaceline#SpaceHL('StatusFileFormat',s:slc,  'lightgray',  'purple')
  call spaceline#spaceline#SpaceHL('StatusLineinfo',s:slc,  'lightblue',  'navy')
  call spaceline#spaceline#SpaceHL('EndSeperate',s:slc,  'yellow',  'purple')
  call spaceline#spaceline#SpaceHL('emptySeperate1',s:slc,  'navy',  'darknavy')
endfunction
