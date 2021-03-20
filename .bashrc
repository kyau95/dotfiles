#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'

# Color variables
bold="\001$(tput bold)\002"
dim="\001$(tput dim)\002"
normal="\001$(tput sgr0)\002"
black="\001$(tput setaf 0)\002"
red="\001$(tput setaf 1)\002"
green="\001$(tput setaf 2)\002"
yellow="\001$(tput setaf 3)\002"
blue="\001$(tput setaf 4)\002"
magenta="\001$(tput setaf 5)\002"
cyan="\001$(tput setaf 6)\002"
white="\001$(tput setaf 7)\002"

# Set colors
PS1="$cyan[\A]$normal "
PS1+="$bold$cyan\W"
PS1+=" ➤➤  $normal"
export PS1
unset bold dim normal black red yellow blue magenta cyan white

## Aliases
alias pacman='yay --color=auto'
alias yay='yay --color=auto'
alias update='sudo pacman -Syyu'

# ls corrections/shortcuts
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

# grep -> ripgrep
alias grep='rg --color=auto'
alias rg='rg --color=auto'

# vi and vim -> nvim
alias vi='nvim'
alias vim='nvim'

neofetch --source ~/.config/block.txt
