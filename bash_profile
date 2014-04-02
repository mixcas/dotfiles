# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
#
# Modified for Mac OS X by
# @corndogcomputer
########################################### 
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="--- "


reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black
# Prompt variable:


PS1="$status_style"'$fill \t\n'"$prompt_style""[\d | \T -> \w ...\$?]\n#""$command_style "
#PS1="$status_style"'$fill \t\n'"$prompt_style""[\d | \T -> \w ...\$?]\n#""$command_style :\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "s
#PS1="[\d | \T -> \w ...\$?]\n#"


# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG


function prompt_command {


# create a $fill of all screen width minus the time string and a space:
let fillsize=${COLUMNS}-9
fill=""
while [ "$fillsize" -gt "0" ]
do
fill="-${fill}" # fill with underscores to work on
let fillsize=${fillsize}-1
done


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
bname=`basename "${PWD/$HOME/~}"`
echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
;;
*)
;;
esac


}
PROMPT_COMMAND=prompt_command

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTSIZE=500
export HISTFILESIZE=500

alias ll='ls -la'
alias cd..='cd ..'
alias vi='mvim'
alias svi='sudo vi'
alias vis='vim "+set si"'
alias apt-get="sudo apt-get"
alias ngrok='~/ngrok'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias sha1='openssl sha1'
alias grep='grep --color=auto'

alias vim='mvim'
#alias djmanage='python manage.py'

alias php.start='launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist'
alias php.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist'
alias nginx='sudo nginx'


export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
#export PATH="/sbin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

export NODE_PATH="/usr/local/lib/node"

#alias lampr="lampo && lamp"

#source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
source ~/.git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin:$PATH

export GOPATH='/Users/cas/go'

