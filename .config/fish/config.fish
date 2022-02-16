source ~/.config/fish/aliases.fish

#if status is-login
#    source ~/.config/fish/env.fish
#end

#set FISH_CLIPBOARD_CMD "cat" # Stop that.

set -gx TERM st-256color

set -Ux LANG en_US.UTF-8 
set -Ux LC_ALL en_US.UTF-8

set -gx EDITOR nvim

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_DIRS /usr/local/share/:/usr/share/

#set -gx fish_add_path -aP $HOME/.local/bin $HOME/.gem/ruby/2.7.0/bin $HOME/Development/golang $HOME/Development/golang/bin /usr/local/opt/mysql@5.6/bin
set -Ux JAVA_HOME /opt/src/jdk-current
set -Ux ANDROID_HOME /home/$USER/Android/Sdk
set -Ux NDK_HOME $ANDROID_HOME/android-ndk-r15c
fish_add_path -g $HOME/.local/bin $HOME/.gem/ruby/2.7.0/bin $HOME/Development/golang $HOME/Development/golang/bin $PATH

# set kitty terminfo
#set -gx TERMINFO $HOME/.terminfo bash -i
#set -gx env TERMINFO=$HOME/.terminfo bash -i
#set -gx TERMINFO /home/darm/.terminfo exec bash -i

#function fish_prompt
#    printf '%s%s%s%s ❯❯❯ ' \
#        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
#end

#function fish_greeting
#    neofetch
#end

# start mpd daemon
function run-mpd
    sudo mpd ~/.config/mpd/mpd.conf $argv
end

function compress
    tar -czvf $argv
end

# check listen ports
function port_listen
    sudo lsof -i:$argv | grep LISTEN
end

#function cek-mon
#    xrandr -q | grep " connected" | cut -d ' ' -f1 $argv
#end

# show response header of website
function showheader
    clear && curl -k -L -I $argv
end

# https://gist.github.com/0xSteeW/337bf7135fd7b4d3a0ae702d07dc35f8
function extract
    if test $argv && test -e $argv
        switch $argv
        case '*.tar.bz2'
            tar xjf $argv
        case '*.tar.gz'
            tar xzf $argv
        case "*.bz2"
            bunzip2 $argv
        case "*.rar"
            unar x $argv
        case "*.gz"
            gunzip $argv
        case "*.tar"
            tar xf $argv
        case "*.tbz2"
            tar xjf $argv
        case "*.tgz"
            tar xzf $argv
        case "*.zip"
            unzip $argv
        case "*.Z"
            uncompress $argv
        case "*.7z"
            7z x $argv
        case "*.deb"
            ar x $argv
        case "*.tar.xz"
            tar xf $argv
        case '*'
            echo "Could not determine file type or cannot be extracted"
        end
    else
        echo "No file provided"
    end
end

function pass-gen
    head /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9-!#$%&()*+,./;?@[\]^_{|}~' | head -c 24 && echo
end

# check last update
function clu
    awk 'END{sub(/\[/,""); print $1}' /var/log/pacman.log
end

starship init fish | source
