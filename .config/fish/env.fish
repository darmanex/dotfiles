set -gx EDITOR nvim

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx fish_add_path -aP $HOME/.local/bin $HOME/.gem/ruby/2.7.0/bin $HOME/Development/golang $HOME/Development/golang/bin /usr/local/opt/mysql@5.6/bin
set -Ux JAVA_HOME /opt/src/jdk-current
set -Ux ANDROID_HOME /home/$USER/Android/Sdk
set -Ux NDK_HOME $ANDROID_HOME/android-ndk-r15c
set -Ux PATH $HOME/.local/bin $HOME/.gem/ruby/2.7.0/bin $HOME/Development/golang $HOME/Development/golang/bin $PATH
