# If you come from bash you might have to change your $PATH.
export PATH="/usr/bin:/usr/local/bin:$PATH"

# Allow any custom binaries
#export PATH=$HOME/.local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Ruby gems
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Default editor
export EDITOR="vim"

# Rust environment
export PATH="$HOME/.cargo/bin:$PATH"

# Go environment
export GOPATH=$HOME/Development/golang
#export GOBIN=$GOPATH/bin
#export GOROOT=/usr/local/bin/go
#export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$GOPATH/bin:$PATH

# Python environemt
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple-darm"

ENABLE_CORRECTION='true'

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#POWERLINE_DETECT_SSH="true"
#POWERLINE_RIGHT_A="date"
#POWERLINE_HIDE_HOST_NAME="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

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
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	colored-man-pages
	archlinux
	cp
	dirhistory
	sudo
	command-not-found
	last-working-dir
	git
	history-substring-search
	sublime
	vagrant
	zsh-syntax-highlighting
	zsh-autosuggestions
	kubectl
	docker
    ruby
	)

export TERM=xterm-256color

export PAGER="most"

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
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## MySQL
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

## Stopping VM Guest
alias mc2db-stop="vboxmanage controlvm 'MC2-DB-ONLINE' savestate"
alias mc2api-stop="vboxmanage controlvm 'MC2-RESTAPI-ONLINE' savestate"


alias pcin="sudo pacman -S"
alias pcs="pacman -Ss"
alias pcu="sudo pacman -Syu"
alias pcr="sudo pacman -R"
alias yse="yay -Ss"
alias yin="yay -S"
alias yre="yay -Rns"
alias yup="yay -Syyy"
alias yugrade=" yay -Syu"

#Generating a List of Only the Installed Package Names
alias ylist="pacman -Qr | awk '{print $1}'"

# Clean up all local caches. Options might limit what is actually cleaned
alias yclean="yay -Sc" # or yay -Scc

# Remove dependencies that are no longer needed, because e.g. the package which needed the dependencies was removed.
alias yautoremove="yay -Qdtq | yay -Rs -" # or to remove recursively => pacman -Rcs $(pacman -Qdtq) 

# Print system statistics
alias yps="yay -Ps"
# git
alias gl-stat="git log -1 --stat"
alias gl-since="git log --since '2016-10-15' --format='%aE' | sort -u"
alias gl-graph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
alias grv="git remote -v"
alias gst="git status"
alias gpush="git push"
alias gpull="git pull"
alias gfetch="git fetch"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias da="dotfiles add"
alias dcm="dotfiles commit -m"
alias dp="dotfiles push"
alias dst='dotfiles status'


# zsh stuff
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias lz="less ~/.zshrc"

# history
alias hg="history | grep"

# Flushing DNS
alias flushdns="dscacheutil -flushcache"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# back to home
alias hm="cd ~"

# clear the screen
alias cls="clear"

# showing ssh config
alias sshcfg="less ~/.ssh/config"
alias con="ssh"
# Lists: src=vitorbritto
# -------------------

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lha ${colorflag}"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias ls="command ls -G"
else
    alias ls="command ls --color"
    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

# `cat` with beautiful colors. requires Pygments installed.
# sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# check network card
alias cek-nic="lspci -knn | grep Net -A2"

## Start tmux when terminal launched
#if [ "$TMUX" = "" ]; then tmux; fi

# Export JAVA
export PATH=$PATH:/opt/src/jdk-current/bin
export JAVA_HOME=/opt/src/jdk-current

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/darm/.sdkman"
[[ -s "/home/darm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/darm/.sdkman/bin/sdkman-init.sh"

## Android SDK
export ANDROID_HOME=/home/$USER/Android/Sdk
export NDK_HOME=$ANDROID_HOME/android-ndk-r15c
export PATH=$PATH:$NDK

# Metasploit
export PATH=/opt/metasploit-framework/bin:$PATH

# connect to wifi
alias wlist='sudo nmcli device wifi list'
alias wcon='sudo nmcli -ask d wifi connect'

# Editor stuff
alias v="vim"
alias n="nano"

alias test-speaker="speaker-test -t wav -c 6"

alias cek-soundcard="lspci -v | grep -i -A7 audio"

# check if wifi driver loaded
alias cek-wifi-driver="lspci -k | grep wifi"

# Kill firefox
alias kill-ff="kill -9 `ps ax|grep 'firefox-developer-edition' | awk '{print $1}'`"

# kill msteams
alias kill-teams="kill -9 `ps ax|grep '/usr/share/teams/teams' | awk '{print $1}'`"

# hidden the hostname
prompt_context () { }

neofetch

function targz() {
  tar -czvf "$1.tar.gz" "$1"
}

function untargz() {
  tar -xzvf $1
}

function _calcram() {
  local sum
  sum=0
  for i in `ps aux | grep -i "$1" | grep -v "grep" | awk '{print $6}'`; do
    sum=$(($i + $sum))
  done
  sum=$(echo "scale=2; $sum / 1024.0" | bc)
  echo $sum
}

#https://github.com/paulmillr/dotfiles/blob/master/home/.zshrc.sh#L229
# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM
function ram() {
  local sum
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
    return 0
  fi

  sum=$(_calcram $app)
  if [[ $sum != "0" ]]; then
    echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM"
  else
    echo "No active processes matching pattern '${fg[blue]}${app}${reset_color}'"
  fi
}

function finder() {
  find . -iname "*${1:-}*"
}

# showing groups,user,args
alias psgroup="ps -eo user,group,supgrp,args | grep"

# generating a random password
alias pass-gen="openssl rand -base64 12 | colrm 32"

alias sctl="systemctl"

# start mpd daemon
alias run-mpd="sudo mpd ~/.config/mpd/mpd.conf"

# bring the wifi interface up
alias wifi-up="sudo ip link set wlp3s0 up"

# check last updated
alias clu="awk 'END{sub(/\[/,""); print $1}' /var/log/pacman.log"
alias clup="egrep 'pacman -Syu' /var/log/pacman.log | tail -1"

# Firefox stuff
#alias kill-ff="ps auxww | grep -i 'Firefox Developer Edition' | grep -v grep | awk '{ print $2 }' | xargs kill -9"
alias kill-ff="kill -9 `ps ax|grep 'firefox-developer-edition' | awk '{print $1}'`"

# Get top proses eating cpu
alias ps-cpu-usage="ps aux | sort -nr -k 3 | head -10"

# Get top proses eating memory
alias ps-mem-usage="ps aux | sort -nr -k 4 | head -10"

# Start tmux when terminal launched
if [ "$TMUX" = ""  ]; then tmux new -s activity; fi

# testing download speed
alias test-dl="/usr/bin/wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

alias gpg="gpg2"

# check current monitor
alias check-mon='xrandr -q | grep " connected" | cut -d ' ' -f1'

# show response header of website
function showheader() {
    clear && wget -q -S -O - $1 > /dev/null
}
