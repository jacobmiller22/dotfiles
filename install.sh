stow zsh
# Load XDG and or proxy related items
source $HOME/.local/share/zsh/xdg.sh
source $HOME/.local/share/zsh/proxy.sh

stow nvim
stow scripts
stow starship
stow tmux


# tmux
git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm


# Detect the operating system
OS="$(uname)"

# Conditionally execute the appropriate script based on the operating system
case "$OS" in
  Darwin)
    # macOS
    source ./install-macos.sh
    ;;
  Linux)
    # Check if the distribution is Ubuntu
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      if [ "$ID" = "ubuntu" ]; then
        source ./install-ubuntu.sh
      else
        echo "Unsupported Linux distribution: $ID"
      fi
    else
      echo "Unsupported Linux distribution"
    fi
    ;;
  CYGWIN*|MINGW32*|MSYS*|MINGW*)
    # Windows (Cygwin, Git Bash, or MSYS)
    source ./install-windows.sh
    ;;
  *)
    echo "Unsupported operating system: $OS"
    ;;
esac


# Universal items
#
