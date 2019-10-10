# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin/usr/bin:$PATH

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="/home/darm/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

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
ZSH_THEME="powerlevel9k/powerlevel9k"
# DISABLE_AUTO_UPDATE="true"

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

#LINUX_OPENSUSE_ICON=$'\uF314'
#POWERLEVEL9K_LINUX_ICON=$'\uF314'
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version command_execution_time)

POWERLEVEL9K_NODE_VERSION_BACKGROUND='seagreen1'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='grey30'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='pink1'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='grey30'

POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON="echo   `whoami` "
POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON_BACKGROUND='lightcoral'
POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON_FOREGROUND='grey30'

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF408 '

ZSH_DISABLE_COMPFIX=true



# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#For compilers to find mysql@5.6 you may need to set:
export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

## Stopping VM Guest
alias mc2db-stop="vboxmanage controlvm 'MC2-DB-ONLINE' savestate"
alias mc2api-stop="vboxmanage controlvm 'MC2-RESTAPI-ONLINE' savestate"

## MySQL
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# git
alias  gitlog-stat="git log -1 --stat"
alias gitlog-since="git log --since '2016-10-15' --format='%aE' | sort -u"
alias gitlog-graph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
alias gRv='git remote -v'

alias hm="cd ~"
alias ll="ls -lha"
alias clr="clear"
alias sshcfg="cat ~/.ssh/config"

# Flushing DNS cache
alias flushdns="dscacheutil -flushcache"

# For metasploit
export PATH=/opt/metasploit-framework/bin:$PATH

## example: export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:/usr/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

## Suse key shortcut
alias zin="sudo zypper install"
alias zse="zypper search"
alias zur="sudo zypper update && sudo zypper refresh"
alias zrepo="sudo zypper addrepo"

## Android SDK
export ANDROID_HOME=/home/$USER/Android/Sdk
export NDK_HOME=$ANDROID_HOME/android-ndk-r15c
export PATH=$PATH:$NDK

## betterlockscreen PATH
export PATH="${PATH}:${HOME}/.bin/scripts/"



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/darm/.sdkman"
[[ -s "/home/darm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/darm/.sdkman/bin/sdkman-init.sh"

## Start tmux when terminal launched
#if [ "$TMUX" = "" ]; then tmux; fi

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Export JAVA
export PATH=$PATH:/opt/src/jdk-current/bin
export JAVA_HOME=/opt/src/jdk-current

