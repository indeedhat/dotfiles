# global import boringness
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source <(find -L ~/.config/bash -type f -exec cat {} +)
# source /opt/anaconda/bin/activate root

export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/home/phpmatt/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/lib"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/.local/sbin"
export PATH="$PATH:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/apps/DataGrip-2022.1.5/bin"

export ARDUINO_DIR=/home/phpmatt/Applications/arduino-1.8.8
export ARDMK_DIR=/home/phpmatt/Documents/Github/Arduino-Makefile
export TERM=xterm-256color
export EDITOR=nvim
export TERMINAL=alacritty
export PAGER=most

export CPATH=$CPATH:/usr/include/gtk-3.0

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/applications"

# export NODE_PATH=$NODE_PATH:`npm root -g`
export ANDROID_SDK_ROOT="/home/phpmatt/Android/Sdk"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$PATH"
# export JAVA_HOME=/usr/lib/jvm/default

complete -C /home/indeedhat/go/bin/gocomplete go
complete -C /home/indeedhat/go/bin/podctl podctl

export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

export GPG_TTY=$(tty)

export GOPRIVATE="github.com/clinkards"

alias luamake=/home/phpmatt/Documents/github/dev-tools/lua-language-server/3rd/luamake/luamake

# set show-mode-in-prompt on
# set vi-cmd-mode-string "\1\e[2 q\2"
# set vi-ins-mode-string "\1\e[6 q\2"
. "$HOME/.cargo/env"

pascal_case() {
    perl -pe 's#(_|^)(.)#\u$2#g'
}

cd() {
    builtin cd "$@" && automux 
}

:qa() {
    if [[ -v TMUX ]]; then
        tmux kill-session
    else
        exit
    fi
}
complete -C /home/matth/Documents/github/ignite/bin/.console-linux console

eval ssh-agent &> /dev/null
export PATH=$PATH:/home/matth/.linkerd2/bin
export PATH="$PATH:/home/matth/Documents/github/ignite-infrastructure/istio-1.20.2/bin"
export PATH="$PATH:/home/matth/Documents/github/ignite-infrastructure/istio-1.20.2/bin"
export PATH="$PATH:/home/matth/Documents/github/ignite-infrastructure/istio-1.20.2/bin"
export PATH="$PATH:/home/matth/Documents/github/ignite-infrastructure/istio-1.20.2/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fzf --bash)"
