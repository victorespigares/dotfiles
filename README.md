# Dotfiles

## Installation

```bash
git clone https://github.com/victorespigares/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
git submodule update --init
```

Don't forget to install:

- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- Run `brew bundle`
- [fasder](https://github.com/wookayin/fasder) (used by zshrc, not covered by brew bundle)
- And run `:PluginInstall` in Vim

## Documentation

- http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
- http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
