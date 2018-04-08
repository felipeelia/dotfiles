# NVM
# See https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/scripts/wp-completion.bash
alias autochmod='find * -type d -exec chmod 755 {} \;;find * -type f -exec chmod 644 {} \;'
alias dockerclear='docker rm -f $(docker ps -a -q)'
