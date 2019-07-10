" =============================================================================
" Filename: spaceline.vim
" Author: taigacute
" URL: https://github.com/taigacute/spaceline.vim
" License: MIT License
" =============================================================================
function! spaceline#seperator#spacelineCustomSeperate()
        let s:seperator={}
        let s:seperator.homemoderight = get(g:, 'spaceline_homemode_right','')
        let s:seperator.filenameright = get(g:, 'spaceline_filename_left','')
        let s:seperator.filesizeright = get(g:, 'spaceline_filesize_right','')
        let s:seperator.gitleft = get(g:, 'spaceline_gitinfo_left','')
        let s:seperator.gitright = get(g:, 'spaceline_gitinfo_right','')
        let s:seperator.lineinfoleft = get(g:, 'spaceline_cocexts_right','')
        let s:seperator.lineformatright = get(g:, 'spaceline_lineformat_right', '')
        let s:seperator.EndSeperate = get(g:, 'spaceline_seperate_endseperate','')
        let s:seperator.emptySeperate1 = get(g:, 'spaceline_seperate_emptyseperate','')
        return s:seperator
endfunction

function! spaceline#seperator#spacelineStyle(style)
    let s:seperator={}
    if a:style == 'slant'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'slant-fade'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'arrow-fade'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'arrow'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'curve'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'none'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ''
        let s:seperator.emptySeperate1 = ''
    endif
    return s:seperator
endfunction

