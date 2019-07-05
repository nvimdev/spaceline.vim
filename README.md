# spaceline.vim

Vim Statusline Like Emacs Spaceline from [ThinkVim](https://github.com/taigacute/ThinkVim)

# Feature

- We have airline, lightline, eleline, why make this plugin? They are great plugins, but they are limited and you can't set more separators.
- More separator combinations make the status bar look better, but to handle combinations in different situations, spaceline does a good job in this area. The combination of each area is very good in different situations.

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'taigacute/spaceline.vim'
```

# Supprot Plugin

- [coc](https://github.com/neoclide/coc.nvim)
- depends on coc extensions `coc-git` ,[vim-devicons](https://github.com/ryanoasis/vim-devicons)

# Mode

- spaceline provide separator groups, include `arrow` `curve` `slant`.the default group is `arrow`

```viml
let g:spaceline_seperate_style= 'arrow'
```

- normal mode

  | group   | ScreenShot                                                                        |
  | ------- | --------------------------------------------------------------------------------- |
  | `none`  | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/none-normal.png)  |
  | `arrow` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow-normal.png) |
  | `curve` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve-normal.png) |
  | `slant` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant-normal.png) |

- synataxcheck mode

  | group   | ScreenShot                                                                 |
  | ------- | -------------------------------------------------------------------------- |
  | `none`  | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/none.png)  |
  | `arrow` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow.png) |
  | `curve` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve.png) |
  | `slant` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant.png) |

- if you doesnt like too many symbols in statusline, just set to 1, default 0

```viml
let g:spaceline_line_symbol = 0
```

# Custom

- you can custom every symbol in spaceline. there are some very useful settings.first you should set the `g:seperate_mode` to 1

```viml

let g:spaceline_seperate_mode = 0
```

- then set any seperate by these settings

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

# Donate

<img src="https://github.com/taigacute/IMG/blob/master/wechat/mm_reward_qrcode_1556454268864.png" width="50%"  height="50%">

# License

MIT
