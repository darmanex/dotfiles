# arch stuff
alias pcin="sudo pacman -S"
alias pcs="pacman -Ss"
alias pcu="sudo pacman -Syu"
alias pcr="sudo pacman -R"
alias yse="yay -Ss"
alias yin="yay -S"
alias yre="yay -Rns"
alias yup="yay -Syyy"
alias yugrade=" yay -Syu"

# Clean up all local caches. Options might limit what is actually cleaned
alias yclean="yay -Sc" # or yay -Scc

# Remove dependencies that are no longer needed, because e.g. the package which needed the dependencies was removed.
alias yautoremove="yay -Qdtq | yay -Rs -" # or to remove recursively => pacman -Rcs $(pacman -Qdtq) 

# Print system statistics
alias yps="yay -Ps"

# git stuff
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

alias ef="nvim ~/.config/fish/config.fish"
alias sf="source ~/.config/fish/config.fish"
alias lf="less ~/.config/fish/config.fish"

# flushing DNS
alias flushdns="nscd -K"

alias sshcfg="less ~/.ssh/config"
alias esshcfg="vim ~/.ssh/config"
alias con="ssh"

alias cls="clear"
alias hg='history | grep'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lha='ls -lha'
alias lt='ls --tree'
alias hg="history | grep"
alias gpg="gpg2"
alias vim="nvim"
alias psf="ps -ef | grep"

# syntax highlighting
alias cat="pygmentize -f terminal256 -O style=monokai -g"

# check network card
alias cek-nic="lspci -knn | grep Net -A2"

# connect to wifi
alias wlist='sudo nmcli device wifi list'
alias wcon='sudo nmcli -ask d wifi connect'

alias test-speaker="speaker-test -t wav -c 6"

alias cek-soundcard="lspci -v | grep -i -A7 audio"

# check if wifi driver loaded
alias cek-wifi-driver="lspci -k | grep wifi"

# kill firefox
alias kill-ff="kill -9 `ps ax|grep 'firefox' | awk '{print $1}'`"

# kill msteams
alias kill-teams="kill -9 `ps ax|grep '/usr/share/teams/teams' | awk '{print $1}'`"

# showing groups,user,args
alias psgroup="ps -eo user,group,supgrp,args | grep"

#alias pass-gen="head /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9-!#$%&()*+,./;?@[\]^_{|}~' | head -c 24 && echo"

alias sctl="systemctl"

# bring the wifi interface up
alias wifi-up="sudo ip link set wlp3s0 up"

# check last update
alias clup="egrep 'pacman -Syu' /var/log/pacman.log | tail -1"

# Get top proses eating cpu
alias ps-cpu-usage="ps aux | sort -nr -k 3 | head -10"

# Get top proses eating memory
alias ps-mem-usage="ps aux | sort -nr -k 4 | head -10"

# testing download speed
alias test-dl="/usr/bin/wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip"

# create server cert
alias gen_cert_server="openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes"

# check age of linux system created
alias cek-age-system="sudo tune2fs -l /dev/sda1 | grep created"
alias cek-age-ssh="stat -c %y /etc/ssh/ssh_host*pub"

# update mirror rank
alias update-mirror="sudo sh -c 'rankmirrors -n 10 mirrorlist.bak > mirrorlist'"

# ps memory usage
alias ps-memory="sudo python ~/Tools/Utility/ps_mem.py"

alias catb='bat --paging=never'

# Check current limits on your system review systemd-journald
alias journald-limits="sudo journalctl -b -u systemd-journald"

# check battery
alias cek-battery="acpi --battery | cut -d, -f2"

# To browse all installed packages with an instant preview of each package
alias list-packages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

## Stopping VM Guest
#alias mc2db-stop="vboxmanage controlvm 'MC2-DB-ONLINE' savestate"
#alias mc2api-stop="vboxmanage controlvm 'MC2-RESTAPI-ONLINE' savestate"
