stow --delete zsh

# neovim
stow --delete nvim
rm -rf $XDG_DATA_HOME/nvim/site/pack

stow --delete scripts
stow --delete starship

# tmux
stow --delete tmux
rm -rf $XDG_CONFIG_HOME/tmux/plugins
