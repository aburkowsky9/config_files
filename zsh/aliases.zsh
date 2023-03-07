#zsh
alias zshconfig="vim ~/.zshrc"
alias zshalias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias reload="exec zsh"
# To fix brew doctor's warning ""config" scripts exist outside your system or Homebrew directories"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias brewconfig="vim ~/config_files/brew/Brewfile"
#commands
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias delbrs='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "main\|master" | xargs git branch -D'
alias hsh='HUSKY=0'
alias git='hsh git'
alias nginx-conf="vim /usr/local/etc/nginx/nginx.conf"
alias curl-head="curl -I -X GET"
alias gitconfig="vim ~/.gitconfig"
alias sleep_off="sudo pmset -c sleep 0"
alias sleep_on="sudo pmset -c sleep 1"
alias get_permissions="stat -f '%A %a %N'"
#alias docker_rm_all="docker rm $(docker ps -aq)"
#alias docker_rmi_all="docker rmi $(docker images -q)"
alias start_docker="open -a Docker"

# Repo Shortcuts
alias frontend="code ~/coding/accomp-frontend"
alias backend="code ~/coding/ah-messaging"
alias infra="code ~/coding/infrastructure"

#IntelliJ Debugging
alias enable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"'
alias disable_debug='export SBT_OPTS="-Xms512m -Xmx2048M -XX:MaxMetaspaceSize=512m -XX:NewRatio=2 -XX:+UseParallelGC"'

