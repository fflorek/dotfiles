
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

autoload -U zmv

function rate() { for i in {1..5}; do if [[ $i -le $1 ]] then echo -ne "\xe2\x98\x85" ; else echo -ne "\xe2\x98\x86" ; fi ; done }
function sayy() { echo "$@" | espeak -p10 -s150 -v mb/mb-en1 2>/dev/null; }

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rsync perl ssh-agent gas gitignore gnu-utils systemd virtualenv cp mosh nmap rsync sudo ssh-agent)

source $ZSH/oh-my-zsh.sh
source $HOME/.alias-tips/alias-tips.plugin.zsh

unsetopt sharehistory

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

bindkey '^b' backward-word
bindkey '^f' forward-word

bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^P' history-incremental-pattern-search-backward
#bindkey '^N' history-incremental-pattern-search-forward


which keychain >/dev/null && keychain --confhost -q

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.aux'

[[ -e ~/.aliases ]] && . ~/.aliases
[[ -e ~/.profile ]] && . ~/.profile

[[ -e ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && . ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

_ag() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}

compdef _ag ag

