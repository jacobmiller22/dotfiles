stow --delete zsh

# neovim
rm -rf $XDG_DATA_HOME/nvim/site/pack
stow --delete nvim

stow --delete scripts
stow --delete starship

# tmux
rm -rf $XDG_CONFIG_HOME/tmux/plugins
stow --delete tmux
