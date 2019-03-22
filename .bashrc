# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Load dot files
echo 'loading dot file (rc)'
for DOTFILE in /home/phpmatt/.dotfiles/.*; do
  if  [ -f $DOTFILE ]; then
     source $DOTFILE
  fi
done


source <(find ~/.includes -type f -exec cat {} +)


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="$PATH:/opt/mssql-tools/bin"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/phpmatt/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/home/phpmatt/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/phpmatt/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/home/phpmatt/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# go things
export GOPATH=/home/phpmatt/go
export PATH=$PATH:$GOPATH/bin

# vim aliases
alias svim="sudo vim"
alias nano="vim"
alias vi="vim"

# some aliases 
alias dirs="dirs -v"
alias ll="ls -alh --color=auto"

alias du="du -h"
alias df="df -h"

alias httpdr="sudo systemctl restart php-fpm; sudo systemctl restart httpd"

# git aliases
alias gcommit="git add . && git commit -am"
alias gpush="git push origin"

#ssh aliases
alias sshlocal="ssh root@10.0.0.69"
alias sshdb="ssh root@10.0.0.218"
alias sshvicky="ssh root@10.0.0.115"
alias sshbecky="ssh root@10.0.0.188"

alias sshav1="ssh root@77.68.80.139"
alias sshav2="ssh root@104.192.6.161"
alias sshav3="ssh root@74.208.129.23"

alias sshpc1="ssh phpmatt@109.228.53.30"
alias sshpc2="ssh root@77.68.29.41"

alias sshjenny="ssh root@10.0.10.1"

# setup the stack
curdir=`pwd`
pushb "/home/phpmatt/Documents/GitHub"

pushb "/home/phpmatt/Documents/Project Documents"
pushb "/home/phpmatt/Documents"
pushb "/home/phpmatt/Downloads"
pushb "/home/phpmatt/Documents/GitHub/ContracterConnector"
pushb "/home/phpmatt/Documents/Github/VoucherMouse"

# Make it pretty
echo -e '    ____          __              ____          __ '
echo -e '   /  _/___  ____/ /__  ___  ____/ / /_  ____ _/ /_'
echo -e '   / // __ \/ __  / _ \/ _ \/ __  / __ \/ __ `/ __/'
echo -e ' _/ // / / / /_/ /  __/  __/ /_/ / / / / /_/ / /_  '
echo -e '/___/_/ /_/\__,_/\___/\___/\__,_/_/ /_/\__,_/\__/  '
echo ''

export PS1='\[\e[2m\]<\[\e[22m\e[34m\]\u\[\e[39m\] dir=\[\e[36m\]"\w"\[\e[2m\e[39m\] mode=\[\e[36m\]"\m"\[\e[2m\e[39m\]/>\[\e[0m\] $ '

# allow for cd without the command
shopt -s autocd
set -o vi
set show-mode-in-prompt on
