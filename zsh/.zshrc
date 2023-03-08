# Profiling zsh plugins - Start of File
#zmodload zsh/zprof

# Eval Homebrew for Mac Chip
eval "$(/opt/homebrew/bin/brew shellenv)"
BREW_PATH="/opt/homebrew"

# Set default $PATH to a variable
export DEFAULT_PATH=$PATH

# 1st Add local node_modules to path followed by global node_modules
export PATH=./node_modules/.bin:~/.npm-global/bin:$PATH

# Add  in location of homebrew's bin & sbin
export PATH=${PATH}:"$BREW_PATH/bin:/usr/local/bin:/usr/local/sbin"

# Add psql to path
export PATH="$BREW_PATH/opt/postgresql@15/bin:$PATH"

# Include desired python instance in path - add back in if pyenv removed
# export PATH=${PATH}:/usr/local/opt/python/libexec/bin

# Add pipenv packages
export PATH=${PATH}:~/.local/bin

# Add back default path by appending to tail
export PATH=${PATH}:${DEFAULT_PATH}

# Next add personal scripts to path
export PATH=${PATH}:~/scripts

# Add golang to path
export GOPATH=$HOME/go
export GOROOT=$BREW_PATH/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOROOT/bin:$PATH

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)

# psql
export LDFLAGS="-L/usr/local/opt/postgresql@15/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/usr/local/opt/postgresql@15/lib/pkgconfig"

# aws
export AWS_DEFAULT_PROFILE="eksadmin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh-nvm plugin options
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export NVM_LAZY_LOAD=true

# Debug git slowness
# export GIT_TRACE=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# Turn off themes in favor prompt set below
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(jsontools copyfile zsh-autosuggestions)
# If not using pnpm - include zsh-nvm

source $ZSH/oh-my-zsh.sh
set ZSH_AUTOSUGGEST_MANUAL_REBIND
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="gti *"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="gti *"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#--------------------- CUSTOM ----------------------------------------

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Add VS code CLI
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$*" ;}

# SBT
ulimit -S -n 4096 #fix for SBT can sometimes reach MacOS's maximum file handle limit
export SBT_OPTS="-XX:MaxMetaspaceSize=1g -Xmx2024m -Xss2m" #fix for various out of memory errors using sbt

# Shell Prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_HOSTNAME='%F{243}'
COLOR_DIR='%F{197}'
COLOR_WHITE='%F{white}'
COLOR_GIT='%F{39}'
COLOR_GREEN='%F{green}'
NEWLINE=$'\n'

setopt PROMPT_SUBST

function precmd {
  PROMPT="${COLOR_HOSTNAME}%m ${COLOR_GREEN}:: ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${NEWLINE}${COLOR_WHITE}» "
  export PROMPT
}

###### Startup ######
eval "$(ssh-agent -s)" > /dev/null

echo "Hello, Alex"
# Uncomment below for version information on shell startup. This may significantly slow down startup.
#nodeVersion="$(node --version)"
#npmVersion="$(npm --version)"
#echo "Using Node Version:" "${nodeVersion}"
#echo "Using NPM Version: " "${npmVersion}"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#echo "Using Python Version: $(python --version)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
export PNPM_HOME="/Users/alexburkowsky/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Profiling zsh plugins - End of File
#zprof
