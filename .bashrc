# .bashrc

# global import boringness
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source <(find ~/.includes -type f -exec cat {} +)

echo -e '    ____          __              ____          __ '
echo -e '   /  _/___  ____/ /__  ___  ____/ / /_  ____ _/ /_'
echo -e '   / // __ \/ __  / _ \/ _ \/ __  / __ \/ __ `/ __/'
echo -e ' _/ // / / / /_/ /  __/  __/ /_/ / / / / /_/ / /_  '
echo -e '/___/_/ /_/\__,_/\___/\___/\__,_/_/ /_/\__,_/\__/  '
echo ''
