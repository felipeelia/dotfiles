# NVM
# See https://github.com/creationix/nvm
export NVM_DIR=$(realpath "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/scripts/wp-completion.bash
alias autochmod='find * -type d -exec chmod 755 {} \;; find * -type f -exec chmod 644 {} \;'
alias base-env='git archive --remote=git@bitbucket.org:felipeelia/base-env.git HEAD | tar x && echo "Don''t forget the theme name in docker/docker-compose.yml!"'
alias cinnamon-restart='cinnamon --replace > /dev/null 2>&1 &'
alias cpwd='echo -n "$(pwd)" | xclip -selection clipboard'
alias dockerclear='docker rm -f $(docker ps -a -q)'
alias docker-update-images='docker images --format "{{.Repository}}:{{.Tag}}" | xargs -L1 docker pull;'
alias sudo='sudo env PATH="$PATH":$NVM_BIN'
alias syncfork="git fetch upstream master && git checkout master && git pull upstream master && git push -f origin master"
alias syncforkdev="git fetch upstream develop && git checkout develop && git pull upstream develop && git push -f origin develop"
alias syncforktrunk="git fetch upstream trunk && git checkout trunk && git pull upstream trunk && git push -f origin trunk"
alias cleanbranches="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"
alias clima="curl wttr.in/curitiba"
alias git-prs="git log trunk..develop --oneline --pretty=format:'%h %aI %s' | grep 'Merge pull request'"

function recreate_db() {
	DB_NAME=$(grep DB_NAME wordpress/wp-config.php | sed -E 's/define.*,.*'\''(.*)'\''.*/\1/g')

	echo -n "Creating database if required..."
	10updocker wp db create --dbuser=root 2>&1 > /dev/null
	echo "Done"

	echo -n "Setting database permissions..."
	echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO 'wordpress'@'%' IDENTIFIED BY 'password';" | 10updocker wp db cli --dbuser=root
	echo "Done"
}
