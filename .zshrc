export XDG_CONFIG_HOME="$HOME/.config"

# tmux path
export TMUX_PLUGIN_MANAGER_PATH="~/.tmux/plugins"
export TMUX_CONF_LOCAL="$XDG_CONFIG_HOME/tmux/tmux.conf.local"
export TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"

# If you come from bash you might have to change your $PATH.
export PATH="/usr/bin:/usr/local/bin:$PATH"

# Allow any custom binaries
export PATH="${PATH}:${HOME}/.local/bin/"

# Ruby gems
export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"

# Default editor
export VISUAL="vim"
export EDITOR="vim"

alias ev="vim ~/.vimrc"

# Rust environment
export PATH="$HOME/.cargo/bin:$PATH"

#export LS_COLORS="di=0;35"
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

export LESS='-R --use-color -Dd+r$Du+b$'

# Go environment
export GOPATH=/mnt/data/darm/Development/golang
export GOBIN=$GOPATH/bin

# Python environemt
#export GOROOT=/usr/local/bin/go
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
eval "$(pyenv init -)"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple-darm"
#ZSH_THEME="Chicago95"

ENABLE_CORRECTION='true'

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

plugins=(
  colored-man-pages
  archlinux
  cp
  dirhistory
  sudo
  command-not-found
  last-working-dir
  git
  sublime
  zsh-syntax-highlighting
  history-substring-search
  zsh-autosuggestions
  kubectl
  docker
  )

export TERM=xterm-256color

export PAGER="most"

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-pattern-search-backward

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
#alias sudo='nocorrect sudo -E '
alias syu='paru -Syu'
alias rus='paru -S'

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
#alias gl-graph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
alias gl-graph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gcom="git commit -m"
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

# stats
alias ps='echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" && ps aux | grep -i'

# zsh stuff
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias lz="less ~/.zshrc"

# history
alias hg="history | grep"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# clear the screen
alias cls="clear"

alias sshcfg="less ~/.ssh/config"
alias esshcfg="vim ~/.ssh/config"
alias con="ssh"

# List only directories
alias lsd='ls -l | grep "^d"'

alias l="ls -l"
alias lha="ls -lha"
alias lt="ls --tree"

alias c="highlight -O ansi"
alias cat="c"

# check network card
alias cek-nic="lspci -knn | grep Net -A2"

# Export JAVA
export PATH=$PATH:/opt/src/jdk-current/bin
export JAVA_HOME=/opt/src/jdk-current

## Android SDK
export ANDROID_HOME=/home/$USER/Android/Sdk
export NDK_HOME=$ANDROID_HOME/android-ndk-r15c
export PATH=$PATH:$NDK

# Metasploit
export PATH=/opt/metasploit-framework/bin:$PATH

# connect to wifi
alias wifils='sudo nmcli device wifi list'
alias wcon='sudo nmcli -ask d wifi connect'

alias test-speaker="speaker-test -t wav -c 6"

alias cek-soundcard="lspci -v | grep -i -A7 audio"

# check if wifi driver loaded
alias cek-wifi-driver="lspci -k | grep wifi"

# Kill firefox
alias kill-ff="kill -9 `ps ax|grep 'firefox' | awk '{print $1}'`"

# kill msteams
alias kill-teams="kill -9 `ps ax|grep '/usr/share/teams/teams' | awk '{print $1}'`"

# kill discord
alias kill-discord="kill -9 `ps ax|grep '/opt/discord/Discord' | awk '{print $1}'`"

# hidden the hostname
prompt_context () { }

neofetch

function targz() {
  tar -czvf "$1.tar.gz" "$1"
}

# function extract

function untargz() {
  tar -xzvf $1
}

x() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.lrz)
        b=$(basename "$1" .tar.lrz)
        lrztar -d "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.lrz)
        b=$(basename "$1" .lrz)
        lrunzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.bz2)
        b=$(basename "$1" .tar.bz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.bz2)
        b=$(basename "$1" .bz2)
        bunzip2 "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.gz)
        b=$(basename "$1" .tar.gz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.gz)
        b=$(basename "$1" .gz)
        gunzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.ipk)
        b=$(basename "$1" .ipk)
        gunzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.xz)
        b=$(basename "$1" .tar.xz)
        bsdtar Jxf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.xz)
        b=$(basename "$1" .gz)
        xz -d "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.rar)
        b=$(basename "$1" .rar)
        unrar e "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar)
        b=$(basename "$1" .tar)
        bsdtar xf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tbz2)
        b=$(basename "$1" .tbz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tgz)
        b=$(basename "$1" .tgz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zip)
        b=$(basename "$1" .zip)
        unzip -qq "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.Z)
        b=$(basename "$1" .Z)
        uncompress "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.7z)
        b=$(basename "$1" .7z)
        7z x "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zst)
        b=$(basename "$1" .zst)
        tar xf "$1" && return 0 ;;
      *.deb)
        b=$(basename "$1" .deb)
        ar x "$1" && return 0 ;;
      *.rpm)
        b=$(basename "$1" .rpm)
        rpmextract.sh "$1" && return 0 ;;
      *) echo "don't know how to extract '$1'..." && return 1 ;;
    esac
    return 0
  else
    echo "'$1' is not a valid file!"
    return 1
  fi
}

# end function extract


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
#alias pass-gen="openssl rand -base64 12 | colrm 32"
alias pass-gen="head /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9-!#$&()*+,./[\]^_{|}' | head -c 24 && echo"

alias sctl="systemctl"

# start mpd daemon
alias run-mpd="sudo mpd ~/.config/mpd/mpd.conf"

# bring the wifi interface up
alias wifi-up="sudo ip link set wlp3s0 up"

# check last updated
alias clu="awk 'END{sub(/\[/,""); print $1}' /var/log/pacman.log"
alias clup="egrep 'pacman -Syu' /var/log/pacman.log | tail -1"

# Get top proses eating cpu
alias ps-cpu-usage="ps aux | sort -nr -k 3 | head -10"

# Get top proses eating memory
alias ps-mem-usage="ps aux | sort -nr -k 4 | head -10"

# Start tmux when terminal launched
if [ "$TMUX" = ""  ]; then tmux new -s activity; fi

alias test-dl="/usr/bin/wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

alias gpg="gpg2"

# check current monitor
alias check-mon='xrandr -q | grep " connected" | cut -d ' ' -f1'

# show response header of website
function showheader() {
    clear && curl -k -L -I $1
}

# k8s stuff
# switch to namespace
alias kcn="kubectl config set-context $(kubectl config current-context) --namespace "
alias ktl="kubectl"
alias kr="kubectl --kubeconfig ~/.kube/local.yaml"
alias krgp="kubectl --kubeconfig ~/.kube/local.yaml get po"
alias krl="kubectl --kubeconfig ~/.kube/local.yaml logs -f"
alias krol="kubectl --kubeconfig ~/.kube/local.yaml rollout restart"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pod"
alias kpf="port-forward"
alias keit="kubectl exec -it"
alias kns="kubectl get namespace"

# function to check port listen
port_listen() {
    sudo lsof -i:$1 | grep LISTEN
}

# create server cert
alias gen_cert_server="openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes"

# load function
fpath=( ~/.config/zshfn "${fpath[@]}" )
autoload -Uz $fpath[1]/*(.:t)

# restart network
alias network-restart="sudo systemctl restart NetworkManager"

# check age of linux system created
alias cek-age-system="sudo tune2fs -l /dev/sda1 | grep created"
alias cek-age-ssh="stat -c %y /etc/ssh/ssh_host*pub"

# update mirror rank
alias update-mirror="sudo sh -c 'rankmirrors -n 10 mirrorlist.bak > mirrorlist'"

# ps memory usage
alias ps-memory="sudo python /mnt/data/darm/Tools/Utility/ps_mem.py"

alias catb='bat --paging=never'

#alias vim="nvim"
#alias oldvim="\vim"
# Blinking cursor using Kitty & tmux
#alias vim='TERM=xterm-kitty vim'

# Check current limits on your system review systemd-journald
alias journald-limits="sudo journalctl -b -u systemd-journald"

# check battery
alias cek-battery="acpi --battery | cut -d, -f2"

# To browse all installed packages with an instant preview of each package
alias list-packages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

# https://github.com/graysky2/configs/blob/master/dotfiles/.zshrc#L47
# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# suckless terminal config
# https://git.suckless.org/st/file/FAQ.html
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

# fix home and end key
# https://unix.stackexchange.com/questions/20298/home-key-not-working-in-terminal#comment1311837_178900
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/darm/.sdkman"
[[ -s "/home/darm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/darm/.sdkman/bin/sdkman-init.sh"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/darm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.rvm/scripts/rvm
