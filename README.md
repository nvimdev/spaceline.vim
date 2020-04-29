# spaceline.vim

Vim Statusline Like Emacs Spaceline from [ThinkVim](https://github.com/taigacute/ThinkVim)

![](https://user-images.githubusercontent.com/41671631/79724703-86ab8f00-831a-11ea-86a7-6a4439694617.png)

# Feature

- We have airline, lightline, eleline, why make this plugin? They are great plugins, but they are limited and you can't set more separators.
- More separator combinations make the status bar look better, and spaceline handles combinations in different situations, very well. The combination of each area is very good in different situations.
- spaceline is faster than lightline and airline
- middle color of spaceline will match your colorscheme background color (now only default colorscheme space support)

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

  | group        | ScreenShot                                                                             |
  | ------------ | -------------------------------------------------------------------------------------- |
  | `none`       | ![none-normal](https://user-images.githubusercontent.com/41671631/79724664-7dbabd80-831a-11ea-917b-aa8ef47fa34f.png)      |
  | `arrow`      | ![arrow](https://user-images.githubusercontent.com/41671631/79724650-7abfcd00-831a-11ea-9a32-1894db707cc7.png)    |
  | `arrow-fade` | ![arrow-fade-normal](https://user-images.githubusercontent.com/41671631/79724643-78f60980-831a-11ea-86b9-51040acd93fe.png) |  
  | `curve`      | ![curve](https://user-images.githubusercontent.com/41671631/79724657-7c899080-831a-11ea-97b9-7377777918a0.png)      |
  | `slant`      | ![slant](https://user-images.githubusercontent.com/41671631/79724693-83180800-831a-11ea-8351-461e64ad352c.png)    |
  | `slant-fade` | ![slant-fade-normal](https://user-images.githubusercontent.com/41671631/79724680-814e4480-831a-11ea-8141-ac17bf0bb4e2.png) |
  | `slant-cons` | ![slant-cons](https://user-images.githubusercontent.com/41671631/79724670-7f848100-831a-11ea-9402-6f8aa272aa0c.png) |



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
