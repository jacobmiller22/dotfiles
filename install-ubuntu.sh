#!/usr/bin/sh

# Assumes the following is installed
# - git
# - curl
# - stow
# - zsh
# - tmux

# (Re)Install Neovim
curr=$(pwd)
suffix=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5) # Generate 5 random chars
echo "suffix is $suffix"
stagedir=/tmp/nvim-install-$suffix
mkdir $stagedir && cd $stagedir
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
PATH=$PATH:/opt/nvim-linux-x86_64/bin # Add neovim to path
cd $curr
rm -rf $stagedir

# Starship
stow starship

# Setup zsh
stow zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
zsh

# Setup tmux
stow tmux
