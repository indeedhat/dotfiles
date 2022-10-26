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
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/Android/Sdk/tools"
export PATH="$PATH:$HOME/Android/Sdk/tools/bin"


export ARDUINO_DIR=/home/indeedhat/Applications/arduino-1.8.8
export ARDMK_DIR=/home/indeedhat/Documents/Github/Arduino-Makefile
export TERM=xterm-256color
export EDITOR=nvim
export ANDROID_NDK_HOME=/home/indeedhat/Android/Sdk/ndk/23.1.7779620
export ANDROID_SDK_ROOT=/home/indeedhat/Android/Sdk

source <(find ~/.config/bash/ -type f -exec cat {} +)

alias luamake=/home/indeedhat/Documents/github/dev-tools/lua-language-server/3rd/luamake/luamake

systemctl --user import-environment DISPLAY PATH
