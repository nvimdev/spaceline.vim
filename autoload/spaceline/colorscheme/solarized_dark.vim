" =============================================================================
" Filename: solarized_dark.vim
" Author: appelgriebsch
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
let s:slc={}
let s:slc.base00 = ['60757c', 0]
let s:slc.base01 = ['54686f', 0]
let s:slc.base02 = ['07333f', 0]
let s:slc.base03 = ['002933', 0]
let s:slc.yellow = ['ac8200', 128]
let s:slc.orange  = ['c14715', 128]
let s:slc.red = ['d12f2d', 128]
let s:slc.magenta = ['c8337b', 128]
let s:slc.violet = ['666bba', 128]
let s:slc.blue = ['2484c7', 128]
let s:slc.cyan = ['289990', 128]
let s:slc.green = ['7e9100', 128]
function! spaceline#colorscheme#solarized_dark#solarized_dark()
    call spaceline#spaceline#SpaceHL('HomeMode', s:slc, 'base03', 'green')
    if get(g:,'spaceline_seperate_style', 'arrow') == 'slant'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'green', 'yellow')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'green','yellow')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'green','cyan')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'green',  'cyan')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'green',  'base03')
    elseif get(g:,'spaceline_seperate_style','arrow') == 'slant-fade'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'green', 'yellow')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'green','yellow')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'green','cyan')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'green',  'cyan')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'green',  'base03')
    elseif get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade'
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'green', 'yellow')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'yellow','green')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'green','cyan')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'cyan',  'green')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'green',  'base03')
    else
        call spaceline#spaceline#SpaceHL('HomeModeRight',s:slc,  'yellow', 'green')
        call spaceline#spaceline#SpaceHL('FileNameRight',s:slc, 'yellow','green')
        call spaceline#spaceline#SpaceHL('FileSizeRight',s:slc, 'cyan','green')
        call spaceline#spaceline#SpaceHL('GitLeft',s:slc,  'cyan',  'green')
        call spaceline#spaceline#SpaceHL('Gitright',s:slc,  'base03',  'green')
    endif
    call spaceline#spaceline#SpaceHL('FileName', s:slc, 'base03', 'yellow')
    call spaceline#spaceline#SpaceHL('Filesize', s:slc, 'base03', 'green')
    call spaceline#spaceline#SpaceHL('HeartSymbol', s:slc, 'base03',  'cyan')
    call spaceline#spaceline#SpaceHL('CocError',s:slc,  'base03',  'cyan')
    call spaceline#spaceline#SpaceHL('CocWarn',s:slc,  'base03',  'cyan')
    call spaceline#spaceline#SpaceHL('GitInfo',s:slc,  'base03',  'green')
    call spaceline#spaceline#SpaceHL('CocBar',s:slc,  'cyan',  'base03')
    call spaceline#spaceline#SpaceHL('LineInfoLeft',s:slc,  'green',  'base03')
    if get(g:,'spaceline_seperate_style', 'arrow') == 'arrow-fade'
        call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'cyan',  'green')
    else
        call spaceline#spaceline#SpaceHL('LineFormatRight',s:slc,  'green',  'cyan')
    endif
    call spaceline#spaceline#SpaceHL('StatusEncod',s:slc,  'base03',  'green')
    call spaceline#spaceline#SpaceHL('StatusFileFormat',s:slc,  'base03',  'green')
    call spaceline#spaceline#SpaceHL('StatusLineinfo',s:slc,  'base03',  'cyan')
    call spaceline#spaceline#SpaceHL('EndSeperate',s:slc,  'base03',  'green')
    call spaceline#spaceline#SpaceHL('VimMode',s:slc,  'base03',  'cyan')
    call spaceline#spaceline#SpaceHL('emptySeperate1',s:slc,  'cyan',  'base03')
endfunction
