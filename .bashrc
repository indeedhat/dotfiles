
source <(find -L ~/.config/bash -type f -exec cat {} +)

export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
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
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export TERM=xterm-256color
export EDITOR=nvim
export TERMINAL=alacritty
export PAGER=most

export GPG_TTY=$(tty)

eval "$(fzf --bash)"
