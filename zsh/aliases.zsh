#===================
# zshrc alias config
#===================

### Aliases
# Config edit aliases
alias zshrc='nano ~/.dotfiles/zsh/zshrc'
alias antigenconf='nano ~/.dotfiles/zsh/antigen.zsh'
alias aliases='nano ~/.dotfiles/zsh/aliases.zsh'
alias paths='nano ~/.dotfiles/zsh/paths.zsh'
alias tmuxconf='nano ~/.dotfiles/tmux/tmux.conf'
alias bashprofile='nano ~/.dotfiles/bash/bash_profile'
alias hosts='sudo nano /etc/hosts'
# Command aliases
alias c='clear'
alias ls='ls -hl --color=auto'
alias grep='grep --color=auto'
if [[ $(uname -a) = *Darwin* ]]; then
  alias rdp=~/.dotfiles/commands/rdp.sh
elif [[ $(uname -a) = *Debian* ]]; then
elif [[ $(uname -a) = *Ubuntu* ]]; then
fi
# Git aliases
alias gfu='git fetch upstream'
alias gmum='git merge upstream/master'
alias gpo='git push origin'
alias gpom='git push origin master'
