# spaceline.vim

Vim Statusline Like Emacs Spaceline from [ThinkVim](https://github.com/taigacute/ThinkVim)

![](https://user-images.githubusercontent.com/41671631/80914738-24be4100-8d80-11ea-962b-500c619464fd.png)

The colorscheme of this image is [oceanic_material](https://github.com/hardcoreplayers/oceanic-material)

# Feature

- We have airline, lightline, eleline, why make this plugin? They are great plugins, but they are limited and you can't set more separators.
- More separator combinations make the status bar look better, and spaceline handles combinations in different situations, very well. The combination of each area is very good in different situations.
- spaceline is faster than lightline and airline
- middle color of spaceline will match your colorscheme background color (now only default colorscheme space support)
- support scroll bar
  ![](https://user-images.githubusercontent.com/41671631/81278046-c0ed8e00-9087-11ea-8d62-e6587ac843e8.gif)

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'hardcoreplayers/spaceline.vim'
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

  | group        | ScreenShot                                                                                                                 |
  | ------------ | -------------------------------------------------------------------------------------------------------------------------- |
  | `none`       | ![none-normal](https://user-images.githubusercontent.com/41671631/79724664-7dbabd80-831a-11ea-917b-aa8ef47fa34f.png)       |
  | `arrow`      | ![arrow](https://user-images.githubusercontent.com/41671631/79724650-7abfcd00-831a-11ea-9a32-1894db707cc7.png)             |
  | `arrow-fade` | ![arrow-fade-normal](https://user-images.githubusercontent.com/41671631/79724643-78f60980-831a-11ea-86b9-51040acd93fe.png) |
  | `curve`      | ![curve](https://user-images.githubusercontent.com/41671631/79724657-7c899080-831a-11ea-97b9-7377777918a0.png)             |
  | `slant`      | ![slant](https://user-images.githubusercontent.com/41671631/79724693-83180800-831a-11ea-8351-461e64ad352c.png)             |
  | `slant-fade` | ![slant-fade-normal](https://user-images.githubusercontent.com/41671631/79724680-814e4480-831a-11ea-8141-ac17bf0bb4e2.png) |
  | `slant-cons` | ![slant-cons](https://user-images.githubusercontent.com/41671631/79724670-7f848100-831a-11ea-9402-6f8aa272aa0c.png)        |

* If you don't like too many symbols in the statusline, just set to `1` (default is `0`)

```viml
let g:spaceline_line_symbol = 0
```

# Colorscheme

- Use this setting to change the spaceline colorscheme:

```viml
let g:spaceline_colorscheme = 'space'
```

# Goyo Support

- check the thinkvim [usage](https://github.com/hardcoreplayers/ThinkVim/blob/master/modules/module-goyo.vim)


# Donate

<img src="https://github.com/glepnir/IMG/blob/master/wechat/mm_reward_qrcode_1556454268864.png" width="50%"  height="50%">

# License

MIT
