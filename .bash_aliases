## ~.bash_aliases
## Used for added alias definitions
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


####################
### My Aliases
####################

alias playground-terminal='cd ~/Desktop/PLAYGROUND_TERMINAL/'
alias nmr='sudo service network-manager restart'

# usb related ------------------------------------------------------------------
alias usbstick="cd /media/$USER/BIEWESCH_K/"
alias gvimportable="/media/$USER/BIEWESCH_K/gVimPortable7.4/gVimPortable.exe"

#alias nvlc='nvlc --no-color'
alias l1='ls -1'
alias sl='sl -ae'

# Windows applications ---------------------------------------------------------
# alias cmd='/home/kevin/.wine/dosdevices/c:/windows/command/start.exe' 
# alias delphi6-windows='/home/kevin/.wine/dosdevices/c:/Program\ Files\ \(x86\)/Borland/Delphi6/Bin/delphi32.exe'

# downloaded applications ------------------------------------------------------
alias blender='/opt/blender-2.79-linux-glibc219-x86_64/blender'
#alias blenderlink="/home/kevin/bin/StartBlenderViaConsole.sh"
alias lyx='/usr/bin/lyx2.2'

# vim shortcut -----------------------------------------------------------------
alias v='vim'
alias n='nvim'

# tmux shortcut ----------------------------------------------------------------
alias t='tmux'
alias tl='tmux ls'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
# alias tr='~/.tmux/plugins/tmux-resurrect/scripts/restore.sh'

# herbstclient -----------------------------------------------------------------
alias hc="herbstclient"

alias vagrant='~/BSP/Semester_1/Vagrant_VM/missaleneous/Vagrant_download/vagrant'

# git alias for dotfiles -------------------------------------------------------
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config-s='config status'
alias config-a='config add'
alias config-c='config commit -m'
alias config-p='config push'

# get faster to the bics folders -----------------------------------------------
alias bics='cd /home/kuni/University/semester_3/BiCS/'
alias bsp='cd /home/kuni/University/semester_3/BSP/'

# swift aliases ----------------------------------------------------------------
alias sb='swift build'
alias sr='swift run'
alias se='swift build && swift run'

# get faster to erasmus stuff --------------------------------------------------
alias tu='cd /home/kuni/University/semester_4/TU-WIEN'
alias ew='cd /home/kuni/University/semester_4/Erasmus/wohnung'
alias em='cd /home/kuni/University/semester_4/Erasmus/Miscellaneous'
alias el='cd /home/kuni/University/semester_4/Erasmus/Learning_Agreement'
