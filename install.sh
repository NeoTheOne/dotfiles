#!/bin/bash
#================================
# Run this script to install configuration files and symlink them to the home directory
#================================

### Download dependencies:
# antigen, make sure brew is installed if you're running OSx
if [[ $(uname -a) = *Darwin* ]]; then
  brew install antigen
elif [[ $(uname -a) = *Debian* ]]; then
  sudo apt-get install zsh-antigen
elif [[ $(uname -a) = *Ubuntu* ]]; then
  sudo apt-get install zsh-antigen
fi

### Rename/backup old/default dotfiles
mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.bash_profile $HOME/.bash_profile_old
mv $HOME/.tmux.conf $HOME/.tmux.conf_old

### Symlinks
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
