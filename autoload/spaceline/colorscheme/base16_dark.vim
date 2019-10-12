" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
let s:slc={}
let s:slc.base16_purple = ['ba8baf', 214]
let s:slc.base16_gray = ['585858', 0]
let s:slc.lightgray= ['7cafc2', 188]
let s:slc.base16_red = ['ab4642', 261]
let s:slc.orange  = ['af5f00', 130]
let s:slc.red = ['cc241d', 124]
let s:slc.blue = ['0087d7', 32]
let s:slc.lightblue = ['86c1b9', 225]
let s:slc.darkbase16_red = ['5f00af', 55]
let s:slc.green = ['afd700', 148]
let s:slc.gray = ['3c3836', 237]
function! spaceline#colorscheme#base16_dark#base16_dark()
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'base16_gray', 'base16_purple')
    if get(g:,'spaceline_seperate_style', 'arrow') == 'slant'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'base16_purple', 'base16_gray')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'base16_red','base16_gray')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'base16_red','base16_gray')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'base16_red',  'base16_gray')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'base16_red',  'gray')
    elseif get(g:,'spaceline_seperate_style','arrow') == 'slant-fade'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'base16_purple', 'base16_gray')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'base16_red','base16_gray')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'base16_red','base16_gray')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'base16_red',  'base16_gray')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'base16_red',  'gray')
    elseif get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'base16_purple', 'base16_gray')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'base16_gray','base16_red')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'base16_red','base16_gray')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'base16_gray',  'base16_red')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'base16_red',  'gray')
    else
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'base16_gray', 'base16_purple')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'base16_gray','base16_red')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'base16_gray','base16_red')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'base16_gray',  'base16_red')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'gray',  'base16_red')
    endif
    call spaceline#spaceline#SpaceHL('FileName', s:slc, 'lightgray', 'base16_gray')
    call spaceline#spaceline#SpaceHL('Filesize', s:slc, 'lightgray', 'base16_red')
    call spaceline#spaceline#SpaceHL('HeartSymbol', s:slc, 'orange',  'base16_gray')
    call spaceline#spaceline#SpaceHL('CocError',s:slc,  'red',  'base16_gray')
    call spaceline#spaceline#SpaceHL('CocWarn',s:slc,  'blue',  'base16_gray')
    call spaceline#spaceline#SpaceHL('GitInfo',s:slc,  'lightgray',  'base16_red')
    call spaceline#spaceline#SpaceHL('CocBar',s:slc,  'lightblue',  'gray')
    call spaceline#spaceline#SpaceHL('LineInfoLeft',s:slc,  'base16_red',  'gray')
    if get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade'
        call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'base16_gray',  'base16_red')
    else
        call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'base16_red',  'base16_gray')
    endif
    call spaceline#spaceline#SpaceHL('StatusEncod',s:slc,  'lightgray',  'base16_red')
    call spaceline#spaceline#SpaceHL('StatusFileFormat',s:slc,  'lightgray',  'base16_red')
    call spaceline#spaceline#SpaceHL('StatusLineinfo',s:slc,  'lightblue',  'base16_gray')
    call spaceline#spaceline#SpaceHL('EndSeperate',s:slc,  'darkbase16_red',  'base16_purple')
    call spaceline#spaceline#SpaceHL('VimMode',s:slc,  'green',  'base16_gray')
    call spaceline#spaceline#SpaceHL('emptySeperate1',s:slc,  'base16_gray',  'gray')
endfunction
