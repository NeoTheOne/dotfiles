#!/bin/bash
#====================================================================================================
# Run this script to download the repository, install dependencies and symlink the config files
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NeoTheOne/dotfiles/master/install.sh)"
#====================================================================================================

### Activate sudo
sudo test 1

### Download & install dependencies:
# brew(on OSx),zsh, git and antigen
if [[ $(uname -a) = *Darwin* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install zsh git antigen
elif [[ $(uname -a) = *Debian* ]]; then
  sudo apt-get install zsh git zsh-antigen
elif [[ $(uname -a) = *Ubuntu* ]]; then
  sudo apt-get install zsh git zsh-antigen
fi

###Download repository
git clone https://github.com/NeoTheOne/dotfiles $HOME/dotfiles

### Change shell
sudo chsh -s /bin/zsh $USER

### Rename/backup old/default dotfiles
mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.bash_profile $HOME/.bash_profile_old
mv $HOME/.tmux.conf $HOME/.tmux.conf_old

### Symlinks
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
