# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh
export ZSH="/home/csolares/.oh-my-zsh"

# Save history
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias lynx="lynx --vikeys"
alias scDownload="python /Volumes/Stuff/Proyectos/cas/SoundCloud/download.py --track"
alias startPostgres="pg_ctl -D /usr/local/var/postgres start"
alias stopPostgres="pg_ctl -D /usr/local/var/postgres stop"

alias youtube480="youtube-dl --no-check-certificate -f '(mp4)[height<480]'"
alias vim="nvim"


# activate virtual environment from any directory from current and up
DEFAULT_VENV_NAME=.venv
DEFAULT_PYTHON_VERSION="3"

# Simple function to create virtual environmnents
function pve() {
  if [ $# -eq 0 ]; then
    local VENV_NAME="$DEFAULT_VENV_NAME"
  else
    local VENV_NAME="$1"
  fi
  if [ ! -d "$VENV_NAME" ]; then
    echo "Creating new Python virtualenv in $VENV_NAME/"
    python$DEFAULT_PYTHON_VERSION -m venv "$VENV_NAME"
    source "$VENV_NAME/bin/activate"
    va
  else
    va
  fi
}

function va() {
  if [ $# -eq 0 ]; then
    local VENV_NAME=$DEFAULT_VENV_NAME
  else
    local VENV_NAME="$1"
  fi
  local slashes=${PWD//[^\/]/}
  local DIR="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    if [ -d "$DIR/$VENV_NAME" ]; then
      source "$DIR/$VENV_NAME/bin/activate"
      return
    fi
    local DIR="$DIR/.."
  done
  echo "no $VENV_NAME/ found from here to OS root"
}

# FUCK
# eval $(thefuck --alias)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  compleat
  wp-cli
  z
  lol
  nvm
  )

source $ZSH/oh-my-zsh.sh

# User configuration
# export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig


# Yarn path
# export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:/usr/bin/yarn"

# Android path
# export ANDROID_HOME=/Volumes/Stuff/Dev/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export ANDROID_SDK=/home/cas/Android/Sdk
export ANDROID_HOME=/home/cas/Android/Sdk
export ANDROID_SDK_ROOT=/home/cas/Android/Sdk/platform-tools
export PATH=${PATH}:${ANDROID_SDK}

# npm path
# export NPM_PATH=/usr/local/bin/node

export PATH="/usr/local/sbin:$PATH"

# Golang
export GOPATH=/Volumes/Stuff/Proyectos/goWork
export PATH=$PATH:$GOPATH/bin

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# fastlane
export PATH="/home/cas/.local/bin:$PATH"

# Java, used for Android dev
# export JAVA_HOME=$(/usr/libexec/java_home)

#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Z
# . `brew --prefix`/etc/profile.d/z.sh

# source /Users/cas/.iterm2_shell_integration.zsh

# Init nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Check for .nvmrc to call autamtically version of node
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

export REACT_EDITOR=nvim
source /usr/share/nvm/init-nvm.sh
export PATH=${PATH}:'/home/cas/Dev/google_appengine_'

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/cas/Dev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cas/Dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/cas/Dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cas/Dev/google-cloud-sdk/completion.zsh.inc'; fi

# PBCOPY
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
