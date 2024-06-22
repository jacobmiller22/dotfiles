# JS related configuration


# Node Version Manager
export NVM_DIR=~/.nvm
if [[ $(uname) == "Darwin" ]]; then 
	source $(brew --prefix nvm)/nvm.sh 
else 
	source $NVM_DIR/nvm.sh 
fi



# bun
# bun completions
[ -s "/Users/jacobmiller22/.bun/_bun" ] && source "/Users/jacobmiller22/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
