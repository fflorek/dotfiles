
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

autoload -U zmv

plugins=( colored-man-pages cp gas git gitignore gitfast git-extrasgnu-utils man mosh nmap perl python rsync rsync ssh-agent ssh-agent sudo systemd tmux virtualenv cabal catimg compleat docker last-working-dir taskwarrior)

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

ZSH_SYNTAX_HIGHLIGHTING="$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -e "$ZSH_SYNTAX_HIGHLIGHTING" ]] && . "$ZSH_SYNTAX_HIGHLIGHTING"
unset ZSH_SYNTAX_HIGHLIGHTING

bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

ZSH_COMPLETIONS="$HOME/.zsh-plugins/zsh-completions"
ZSH_BORG_COMPLETION="$HOME/.zsh-plugins/borgbackup-zsh-completion"


[[ -e "$ZSH_COMPLETIONS" ]] && fpath=("$ZSH_COMPLETIONS" $fpath)
[[ -e "$ZSH_BORG_COMPLETION" ]] && fpath=("$ZSH_BORG_COMPLETION" $fpath)
unset ZSH_COMPLETIONS ZSH_BORG_COMPLETION

# added by travis gem
[ -f /home/florek/.travis/travis.sh ] && source /home/florek/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
