source ~/scripts/wp-completion.bash
alias autochmod='find * -type d -exec chmod 755 {} \;;find * -type f -exec chmod 644 {} \;'
alias dockerclear="docker rm -f $(docker ps -a -q)"
