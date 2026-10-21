for f in ~/.config/zsh/*(N-.); do
    source "$f"
done

typeset -U path
path=(
    $HOME/.local/bin
    $path
    $HOME/.config/composer/vendor/bin
    $HOME/go/bin
    /usr/local/go/bin
    /usr/local/lib
    /usr/local/bin
    $HOME/bin
    $HOME/.cargo/bin
    $HOME/Android/Sdk/platform-tools
    $HOME/.local/share/gem/ruby/3.0.0/bin
    $HOME/.local/sbin
    /usr/local/share/dotnet
    $HOME/.dotnet/tools
)
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env

export TERM=xterm-256color
export EDITOR=nvim
export TERMINAL=alacritty
(( $+commands[most] )) && export PAGER=most

export GPG_TTY=$(tty)

source <(fzf --zsh)
