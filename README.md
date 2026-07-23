# Dotfiles

## Installation

```bash
git clone https://github.com/victorespigares/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Don't forget to install:

- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- Run `brew bundle`
- [fasder](https://github.com/wookayin/fasder) (used by zshrc, not covered by brew bundle)
- And run `:PluginInstall` in Vim

## Documentation

- http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
- http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

## Cheatsheet: Terminal (zsh + fasder + fzf)

| Command | Action |
|---|---|
| `j <term>` | Jumps to the "frecent" directory matching the term |
| `jj <term>` | Same as `j` but with an interactive fzf menu |
| `f <term>` | Filters/lists frecent files |
| `v <term>` | Opens the matching frecent file with `$EDITOR` |
| `vv <term>` | Same as `v` but with fzf selection first |
| `a <term>` | Lists files and directories together |
| `Ctrl+T` | Searches files with fzf, inserts the path |
| `Ctrl+R` | Searches command history with fzf |
| `Alt+C` | Searches directories with fzf and `cd`s into it |
| `ll` / `l` | `ls -l` / `ls -la` |
| `claude` | Detects current folder, auto-switches work/personal config |
| `node` / `npm` | Forces `nvm use default` before running |

## Cheatsheet: Vim (leader = `,`)

| Shortcut | Action |
|---|---|
| `,,` | List open buffers (fzf) |
| `,r` | Recent files (MRU) via fzf |
| `,t` | Find file by name (fzf `:Files`) |
| `;` | Search text across the whole project (`:Ag`) |
| `,*` | Search the word under the cursor across the project |
| `<Tab>` (normal) | Jumps to the previous buffer (`:b#`) |
| `jj` (insert/cmd) | Quick escape (vim-easyescape) |
| `gcw` / `gciw` | Capitalize word / inner word |
| `'` / `` ` `` | Swapped: `'` jumps to exact mark, `` ` `` to line |
| Sessions | Auto-saved/loaded per folder when opening/closing vim without arguments |
| Built-in terminal | `:terminal` opens with fixed height (10 lines), splits below |

### Active plugins
`fzf.vim`, `fzf-mru`, `vim-surround`, `vim-airline`, `vim-easyescape`, `vim-javascript`, `vim-jsx-pretty`, `typescript-vim`, `vim-tsx`, `PaperColor` (theme).
