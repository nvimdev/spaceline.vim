# spaceline.vim

Vim Statusline Like Emacs Spaceline from [ThinkVim](https://github.com/taigacute/ThinkVim)

# Feature

- We have airline, lightline, eleline, why make this plugin? They are great plugins, but they are limited and you can't set more separators.
- More separator combinations make the status bar look better, and spaceline handles combinations in different situations, very well. The combination of each area is very good in different situations.
- spaceline is faster than lightline and airline

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'taigacute/spaceline.vim'
```

# Required Plugins

- [coc](https://github.com/neoclide/coc.nvim)
- Depends on coc extensions `coc-git`
- [vim-devicons](https://github.com/ryanoasis/vim-devicons)

# Mode

- spaceline provide some separator groups, the default group is `arrow`

```viml
let g:spaceline_seperate_style= 'arrow'
```

- normal mode

  | group        | ScreenShot                                                                             |
  | ------------ | -------------------------------------------------------------------------------------- |
  | `none`       | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/none-normal.png)       |
  | `arrow`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow-normal.png)      |
  | `arrow-fade` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow-fade-normal.png) |  
  | `curve`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve-normal.png)      |
  | `slant`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant-normal.png)      |
  | `slant-fade` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant-fade-normal.png) |
  | `slant-cons` | ![image](https://raw.githubusercontent.com/taigacute/IMG/master/spaceline/slant-cons.png) |

- syntaxcheck mode

  | group        | ScreenShot                                                                            |
  | ------------ | ------------------------------------------------------------------------------------- |
  | `none`       | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/none.png)             |
  | `arrow`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow.png)            |
  | `arrow-fade` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow-fade-error.png) |
  | `curve`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve.png)            |
  | `slant`      | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant.png)            |
  | `slant-fade` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant-fade-error.png) |

- If you don't like too many symbols in the statusline, just set to `1` (default is `0`)

```viml
let g:spaceline_line_symbol = 0
```

# Colorscheme

- Use this setting to change the spaceline colorscheme:

```viml
let g:spaceline_colorscheme = 'space'
```

- base16_dark

- solarized_dark made by [appelgriebsch](https://github.com/appelgriebsch)
  ![image](https://github.com/taigacute/IMG/blob/master/spaceline/solarized_dark.png)

# Goyo Support
- check the thinkvim [usage](https://github.com/hardcoreplayers/ThinkVim/blob/master/modules/module-goyo.vim)

# Custom

- You can customize every symbol in spaceline. There are some very useful settings, first, you should set the `g:seperate_mode` to `1`

```viml
let g:spaceline_seperate_mode = 0
```

- Then set seperators by these settings:

```viml
        let g:spaceline_homemode_right = ''
        let g:spaceline_filename_left  = ''
        let g:spaceline_filesize_right = ''
        let g:spaceline_gitinfo_left   = ''
        let g:spaceline_gitinfo_right  = ''
        let g:spaceline_cocexts_right  = ''
        let g:spaceline_lineformat_right = ''
        let g:spaceline_seperate_endseperate = ''
        let g:spaceline_seperate_emptyseperate = ''
```

# Thanks

<a href="https://github.com/appelgriebsch" target="_blank" title="appelgriebsch">
  <img src="https://github.com/appelgriebsch.png?size=64" width="64" height="64" alt="appelgriebsch">
</a>

<a href="https://github.com/rafi" target="_blank" title="rafi">
  <img src="https://github.com/rafi.png?size=64" width="64" height="64" alt="rafi">
</a>

# Donate

<img src="https://github.com/taigacute/IMG/blob/master/wechat/mm_reward_qrcode_1556454268864.png" width="50%"  height="50%">

# License

MIT
