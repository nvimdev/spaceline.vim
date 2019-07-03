# spaceline.vim

Vim Statusline Like Emacs Spaceline.

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'taigacute/spaceline.vim'
```

# Supprot Plugin

- [coc](https://github.com/neoclide/coc.nvim)
- depends on coc extensions `coc-git`

# Operation

- you can custom every symbol in spaceline. there are some very useful settings.

```viml
let g:spaceline_seperate_1                     ----> default value:''
let g:spaceline_seperate_2                     ----> default value:''
let g:spaceline_seperate_3                     ----> default value:''
let g:spaceline_seperate_5                     ----> default value:''
let g:spaceline_seperate_4                     ----> default value:''
let g:spaceline_seperate_endseperate           ----> default value:''
let g:spaceline_seperate_emptyseperate         ----> default value:''

```

- spaceline also provide separator group

| group | ScreenShot                                                                 |
| ----- | -------------------------------------------------------------------------- |
| slant | ![image](https://github.com/taigacute/IMG/blob/master/spaceline/slant.png) |

# License

MIT
