# spaceline.vim

The best vim statusline plugin.

![new](https://user-images.githubusercontent.com/41671631/89755347-b4a72000-db11-11ea-8a01-e69c69e020ff.png)

# Features

- Fast load speed
- More separator support
- Highly customizable
- More beautiful than other statusline plugins
- Special color scheme
- File icon syntax highlight
- Scroll bar

# Install

- Easy installed with a plugin manager like vim-plug

```
Plug 'glepnir/spaceline.vim'
" Use the icon plugin for better behavior
Plug 'ryanoasis/vim-devicons' or 'kyazdani42/nvim-web-devicons' --neovim only
```

# Options

- spaceline provide some separator groups, the default group is `arrow`

```viml
let g:spaceline_seperate_style = 'arrow'
```

| group        | Screen shot                                                                                                         |
| ------------ | ------------------------------------------------------------------------------------------------------------------- |
| `none`       | ![none](https://user-images.githubusercontent.com/41671631/89510132-c54e5200-d802-11ea-90f5-2346d7e049ca.png)       |
| `arrow`      | ![arrow](https://user-images.githubusercontent.com/41671631/89510121-c2ebf800-d802-11ea-85d3-028ea21ab62d.png)      |
| `arrow-fade` | ![arrow-fade](https://user-images.githubusercontent.com/41671631/89510114-c0899e00-d802-11ea-8a95-a6f3f4857697.png) |
| `curve`      | ![curve](https://user-images.githubusercontent.com/41671631/89510127-c41d2500-d802-11ea-867e-d37fbb4fb182.png)      |
| `slant`      | ![slant](https://user-images.githubusercontent.com/41671631/89510140-c7181580-d802-11ea-8770-567d0dcccc07.png)      |
| `slant-fade` | ![slant-fade](https://user-images.githubusercontent.com/41671631/89510136-c5e6e880-d802-11ea-8892-3677e90d7086.png) |
| `slant-cons` | ![slant-cons](https://user-images.githubusercontent.com/41671631/89510589-5a514b00-d803-11ea-8228-dc8d8778f346.png) |

- Use this setting to change the spaceline colorscheme, now builtin colorscheme
  `space`,`one`, `nord`, `dracula`

```viml
let g:spaceline_colorscheme = 'space'
```

- `g:spaceline_custom_vim_status` custom vim status display. Default is

```vim
 {"n": "🅝 ","V":"🅥 ","v":"🅥 ","\<C-v>": "🅥 ","i":"🅘 ","R":"🅡 ","s":"🅢 ","t":"🅣 ","c":"🅒 ","!":"SE"}
```

- `g:spaceline_custom_buffer_number` custom buffer number display value is list

- `g:spaceline_diagnostic_tool` set your diagnostic plugin. Default is `coc`, other values are:
  `nvim_lsp`, `ale`

- `g:spaceline_diagnostic_errorsign` set the error sign. Default is `●`
- `g:spaceline_diagnostic_warnsign` set the warn sign. Default is `●`
- `g:spaceline_diagnostic_oksign` set the ok sign. Default is ``

- `g:spaceline_git_branch_icon` set the git branch icon default is empty
- `g:spaceline_custom_diff_icon` custom diff icon. Default is

```vim
 ['','','']
```

- `g:spaceline_diff_tool` set the git diff tool default is `coc`.
  Other values are: `git-gutter`, which requires the [vim-gitgutter](https://github.com/airblade/vim-gitgutter) plugin;
  `vim-signify`, which requires the [vim-signify](https://github.com/mhinz/vim-signify) plugin.


- `g:spaceline_function_icon` set the function icon

- `g:spaceline_scroll_bar_chars` set the scroll bar chars. Some alternatives:

```vimscript
" one char wide solid vertical bar This is default
let g:spaceline_scroll_chars = [
  \  ' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ]

" two char wide fade-in blocks
let g:spaceline_scroll_chars = [
  \ '  ', '░ ', '▒ ', '▓ ', '█ ', '█░', '█▒', '█▓', '██'
  \ ]

" three char wide solid horizontal bar
let g:spaceline_scroll_chars = [
  \ '   ', '▏  ', '▎  ', '▍  ', '▌  ',
  \ '▋  ', '▊  ', '▉  ', '█  ', '█▏ ',
  \ '█▎ ', '█▍ ', '█▌ ', '█▋ ', '█▊ ',
  \ '█▉ ', '██ ', '██▏', '██▎', '██▍',
  \ '██▌', '██▋', '██▊', '██▉', '███'
  \ ]

let g:spaceline_scroll_chars = ['⎺', '⎻', '─', '⎼', '⎽'] " on macOS

let g:spaceline_scroll_chars = ['⎺', '⎻', '⎼', '⎽', '⎯'] " on Linux

```

# Goyo Support

- check out thinkvim [usage](https://github.com/hardcoreplayers/ThinkVim/blob/master/modules/module-goyo.vim)

# FAQ

- Why do the symbols look weird in my vim?

Make sure you have installed nerdfont font from https://www.nerdfonts.com/, different fonts may be inconsistent in the performance of symbols.
If you are using iTerm2 on macOS, you can set a different font for symbols.

<center>
  <img src="https://user-images.githubusercontent.com/41671631/88161810-0c551880-cc43-11ea-9699-17150cd7813a.png" height="300", weight="300"/>
</center>

Another solution is to use [kitty terminal](https://github.com/kovidgoyal/kitty). Kitty has built-in symbol font support and supports both
Mac and Linux.


# License

MIT
