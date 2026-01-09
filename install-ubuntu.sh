#!/usr/bin/sh

# Assumes the following is installed
# - git
# - curl
# - stow
# - zsh
# - tmux
echo "dotfiles ubuntu installer executed!"

# Custom scripts
echo "Setting up scripts!"
stow scripts

# (Re)Install Neovim
echo "Setting up neovim!"
curr=$(pwd)
suffix=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5) # Generate 5 random chars
stagedir=/tmp/nvim-install-$suffix
mkdir $stagedir && cd $stagedir
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
PATH=$PATH:/opt/nvim-linux-x86_64/bin # Add neovim to path
cd $curr
rm -rf $stagedir
stow nvim

# Starship
echo "Setting up starship!"
stow starship

# Setup zsh
echo "Setting up zsh!"
stow zsh
command -v zsh | sudo tee -a /etc/shells

# Setup tmux
echo "Setting up tmux!"
stow tmux
if [ ! -d $HOME/.config/tmux/plugins/tpm ]; then
    ssh-add && git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi

echo "dotfiles ubuntu installer success!"



# Install golang
curr=$(pwd)
stagedir=/tmp/go-install-$suffix
mkdir $stagedir && cd $stagedir
go_version="1.25.5"
archive="go${go_version}.linux-amd64.tar.gz"
rm archive
curl -LO "https://go.dev/dl/go${go_version}.linux-amd64.tar.gz"
rm -rf /usr/local/go # Delete previous installations
tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz
rm archive
cd $curr
rm -rf $stagedir
stow nvim

