source ~/dotfiles/antigen/antigen.zsh
source ~/dotfiles/zsh/theme.zsh

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

source ~/dotfiles/zsh/aliases.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle dirhistory
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

clear
