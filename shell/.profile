# for powerline 
POWERLINE_CONFIG_COMMAND=powerline-config
export PYTHONPATH=$HOME/.local/powerline 

export PATH=$PATH:/opt/bin/
export PATH=$PATH:$GOBIN

export EDITOR=vim

export TZ=Europe/Warsaw

export LD_LIBRARY_PATH=/home/florek/install/rust/lib/ 

[[ $COLORTERM = gnome-terminal && ! $TERM = screen-256color ]] && TERM=xterm-256color

#:if [ -e /home/florek/.nix-profile/etc/profile.d/nix.sh ]; then . /home/florek/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin

PATH=$PATH:/usr/games/bin

#PATH=$PATH:/opt/android-sdk-update-manager/tools
#PATH=$PATH:/opt/android-sdk-update-manager/platform-tools
PATH=$PATH:/opt/sbin

PATH=$HOME/.bin:$PATH
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/games/.bin
PATH=$PATH:$HOME/Games/.bin
PATH=$PATH:$HOME/.local/powerline/scripts

PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin

export PATH;

