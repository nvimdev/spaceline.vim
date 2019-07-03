# spaceline.vim

Vim Statusline Like Emacs Spaceline from [ThinkVim](https://github.com/taigacute/ThinkVim)

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'taigacute/spaceline.vim'
```

# Supprot Plugin

- [coc](https://github.com/neoclide/coc.nvim)
- depends on coc extensions `coc-git`

# Mode

- spaceline provide separator groups, include `arrow` `curve` `slant`.the default group is `arrow`

```viml

let s:seperate_style = 'arro'
```

- normal mode

  | group   | ScreenShot                                                                        |
  | ------- | --------------------------------------------------------------------------------- |
  | `arrow` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow-normal.png) |
  | `curve` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve.png)        |
  | `slant` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant.png)        |

- synataxcheck mode

  | group   | ScreenShot                                                                        |
  | ------- | --------------------------------------------------------------------------------- |
  | `arrow` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/arrow.png)        |
  | `curve` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/curve-normal.png) |
  | `slant` | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant-normal.png) |  |

# Custom

- you can custom every symbol in spaceline. there are some very useful settings.first you should set the `g:seperate_mode` to 1

```viml

let s:seperate_mode = 0
```

- then set any seperate by these settings

```viml
    let s:homemoderight
    let s:filenameright
    let s:filesizeright
    let s:gitleft
    let s:gitright
    let s:lineinfoleft
    let s:lineformatright
    let s:EndSeperate
    let s:emptySeperate1
```

# License

MIT
