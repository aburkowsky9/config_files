alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias delbrs='git for-each-ref --format "%(refname:short)" refs/heads | grep -v master | xargs git branch -D'
alias enable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"'
alias disable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC"'
alias hsh='HUSKY_SKIP_HOOKS=1'
export PATH=${PATH}:~/.npm-global/bin
export PATH=${PATH}:./node_modules/.bin
export PATH="/usr/local/opt/cython/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=${PATH}:~/bin

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;} #add VS code CLI

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export HISTCONTROL=ignoreboth         #ignoredups:#ignorespace
export HISTIGNORE='history:pwd:exit'

export GREP_OPTIONS='--color=auto'

if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

ulimit -S -n 4096 #fix for SBT can sometimes reach MacOS's maximum file handle limit
export SBT_OPTS="-XX:MaxMetaspaceSize=1g -Xmx2024m -Xss2m" #fix for various out of memory errors using sbt

source ~/.bashrc

nodeVersion="$(node --version)"
echo "Hello, Alex"
echo "Using Node Version:" "${nodeVersion}"
source ~/bin/check-git
