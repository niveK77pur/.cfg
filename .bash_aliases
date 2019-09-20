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

# usb related
alias usbstick="cd /media/"$USER"/BIEWESCH_K/"
alias gvimportable='/media/kevin/BIEWESCH_K/gVimPortable7.4/gVimPortable.exe'

#alias nvlc='nvlc --no-color'
alias l1='ls -1'
alias sl='sl -ae'

# Windows applications
alias cmd='/home/kevin/.wine/dosdevices/c:/windows/command/start.exe' 
alias delphi6-windows='/home/kevin/.wine/dosdevices/c:/Program\ Files\ \(x86\)/Borland/Delphi6/Bin/delphi32.exe'

# downloaded applications
alias blender='/opt/blender-2.79-linux-glibc219-x86_64/blender'
#alias blenderlink="/home/kevin/bin/StartBlenderViaConsole.sh"
alias lyx='/usr/bin/lyx2.2'
#alias atom='/home/kevin/atom/usr/bin/atom'

# vim shortcut
alias v='vim'

alias vagrant='~/BSP/Semester_1/Vagrant_VM/missaleneous/Vagrant_download/vagrant'

# git alias for dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config-s='config status'
alias config-a='config add'
alias config-c='config commit -m'
alias config-p='config push'

# get faster to the bics folders
alias bics='cd /home/kuni/University/semester_3/BiCS/'
alias bsp='cd /home/kuni/University/semester_3/BSP/'
