# AstroNvim Template

## Installation

Use Homebrew to upgrade vim as backup and neovim for main use:

```shell
brew install neovim
```

Once everything is installed, symlink vim configs:

```shell
# Linux / MacOS (unix)

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
ln -s ~/Config/Nvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
