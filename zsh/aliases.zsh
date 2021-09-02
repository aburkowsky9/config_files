#zsh
alias zshconfig="vim ~/.zshrc"
alias zshalias="vim ~/.oh-my-zsh/custom/aliases.zsh"

#commands
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias delbrs='git for-each-ref --format "%(refname:short)" refs/heads | grep -v main | xargs git branch -D'
alias hsh='HUSKY_SKIP_HOOKS=1'
alias nginx-conf="vim /usr/local/etc/nginx/nginx.conf"
alias curl-head="curl -I -X GET"

# Repo Shortcuts
alias frontend="code ~/coding/frontend"
alias infra="code ~/coding/infrastructure"

#IntelliJ Debugging
alias enable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"'
alias disable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC"'

