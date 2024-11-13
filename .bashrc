# global import boringness
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source <(find -L ~/.config/bash -type f -exec cat {} +)

export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/home/phpmatt/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/lib"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/.local/sbin"


export TERM=xterm-256color
export EDITOR=nvim
export TERMINAL=alacritty
export PAGER=most

export CPATH=$CPATH:/usr/include/gtk-3.0

export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$PATH"

complete -C /home/phpmatt/go/bin/gocomplete go
complete -C /home/phpmatt/go/bin/podctl podctl

export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

alias luamake=/home/phpmatt/Documents/github/dev-tools/lua-language-server/3rd/luamake/luamake

source /usr/share/nvm/init-nvm.sh
