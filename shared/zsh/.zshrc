# Settings file.
source ~/.zsettings

export GTK2_RC_FILES=/etc/gtk-2.0/gtkrc:/home/$USER/.gtkrc-2.0
alias rec='ffmpeg -f x11grab -s 1920x1080 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y'
alias recaud='ffmpeg -f x11grab -s 1920x1080 -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y'

alias update='gem update && sudo pacman -Syu && yaourt -Syua'

alias shit='sudo $(fc -nl -1)'
function fuck() {
  if [ ! $1 ]; then
    echo "Usage: fuck you process_name"
    exit
  fi

  if killall $2; then
    echo
    echo " (╯°□°）╯︵$(echo $2 | flip)"
    echo
  fi
}
alias ksp='LC_ALL=C $HOME/.steam/steam/steamapps/common/Kerbal\ Space\ Program/KSP.x86_64'

function so() {
  xdg-open "https://stackoverflow.com/search?q=$1"
}

alias open='xdg-open'

alias minecraft='java -jar ~/.minecraft/Minecraft.jar'
alias git=hub

export GOPATH=$HOME/go

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

export ANDROID_HOME="/opt/android-sdk"

alias please='sudo !!'

# Make a directory and then cd into it.
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

git-wholazy() {
    git log --author="$1" --pretty=tformat: --numstat | awk '{ s += $1; t += $2 } END { print s " added, "t " removed" }'
}

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# https://github.com/zeit/zeit.zsh-theme
ZSH_THEME="zeit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux, bower, emoji, git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/scripts:~/go/bin
PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $HOME/.profile

export GTK2_RC_FILES="/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0"
#Colors
export COLOR_BG=$( cat ~/.Xresources | awk '/background/ { printf "%s\n", $2 }' )
export COLOR_FG=$( cat ~/.Xresources | awk '/foreground/ { printf "%s\n", $2 }' )
export COLOR_0=$( cat ~/.Xresources | awk '/color0/ { printf "%s\n", $2 }' )
export COLOR_1=$( cat ~/.Xresources | awk '/color1/ { printf "%s\n", $2 }' )
export COLOR_2=$( cat ~/.Xresources | awk '/color2/ { printf "%s\n", $2 }' )
export COLOR_3=$( cat ~/.Xresources | awk '/color3/ { printf "%s\n", $2 }' )
export COLOR_4=$( cat ~/.Xresources | awk '/color4/ { printf "%s\n", $2 }' )
export COLOR_5=$( cat ~/.Xresources | awk '/color5/ { printf "%s\n", $2 }' )
export COLOR_6=$( cat ~/.Xresources | awk '/color6/ { printf "%s\n", $2 }' )
export COLOR_7=$( cat ~/.Xresources | awk '/color7/ { printf "%s\n", $2 }' )
export COLOR_8=$( cat ~/.Xresources | awk '/color8/ { printf "%s\n", $2 }' )
export COLOR_9=$( cat ~/.Xresources | awk '/color9/ { printf "%s\n", $2 }' )
export COLOR_10=$( cat ~/.Xresources | awk '/color10/ { printf "%s\n", $2 }' )
export COLOR_11=$( cat ~/.Xresources | awk '/color11/ { printf "%s\n", $2 }' )
export COLOR_12=$( cat ~/.Xresources | awk '/color12/ { printf "%s\n", $2 }' )
export COLOR_13=$( cat ~/.Xresources | awk '/color13/ { printf "%s\n", $2 }' )
export COLOR_14=$( cat ~/.Xresources | awk '/color14/ { printf "%s\n", $2 }' )
export COLOR_15=$( cat ~/.Xresources | awk '/color15/ { printf "%s\n", $2 }' )

eval $(dircolors ~/.dircolors)

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY
eval "$(hub alias -s)"

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

export NVM_DIR="/home/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# call nvm use automatically in a directory with .nvmrc
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

source ~/.zprofile
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias dttmomsea="echo 'dont zsh me or my son ever again'"
alias timestamp="date +%Y%m%d%H%M%S"

function countwords() {
    pdftotext $1 - | wc -w
}

if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
export AURDEST=/build/$USER

# added by travis gem
[ -f /home/$USER/.travis/travis.sh ] && source /home/$USER/.travis/travis.sh
alias nowplaying='echo "$(playerctl metadata artist 2>/dev/null) - $(playerctl metadata title 2>/dev/null)" '
alias musicfile='while sleep 5; do echo "Now playing: $(nowplaying)" > /tmp/music ; done'
alias django="python manage.py"

gitignore() {
  if [ ! -f ./.gitignore ]; then
    curl "https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore" > ./.gitignore
  fi
}

export RANGER_LOAD_DEFAULT_RC=false
alias nodejs=node
