# .bashrc

# global import boringness
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/home/indeedhat/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/lib"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

export ARDUINO_DIR=/home/indeedhat/Applications/arduino-1.8.8
export ARDMK_DIR=/home/indeedhat/Documents/Github/Arduino-Makefile
export TERM=xterm-256color
export EDITOR=nvim

source <(find ~/.config/bash/ -type f -exec cat {} +)

alias luamake=/home/indeedhat/Documents/github/dev-tools/lua-language-server/3rd/luamake/luamake

systemctl --user import-environment DISPLAY PATH
