#!/bin/bash
#====================================================================================================
# Run this script to download the repository, install dependencies and symlink the config files
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/NeoTheOne/dotfiles/master/install.sh)"
# !!!CAUTION!!! The script restarts your computer so make any backups needed.
#====================================================================================================

### Activate sudo
sudo test 1

### Download & install dependencies:
# brew(on OSx), zsh, tmux, git, antigen and neofetch
if [[ $(uname -a) = *Darwin* ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew install zsh tmux git neofetch
elif [[ $(uname -a) = *Debian* ]]; then
  sudo apt-get update
  sudo apt-get install zsh tmux git neofetch
elif [[ $(uname -a) = *Ubuntu* ]]; then
  sudo apt-get update
  sudo apt-get install zsh tmux git neofetch
  sudo locale-gen en_US.UTF-8
elif [[ $(uname -a) = *PVE* ]]; then
  sudo apt-get update
  sudo apt-get install zsh tmux git neofetch
  sudo locale-gen en_US.UTF-8
elif [[ $(uname -a) = *WSL* ]]; then
  sudo apt-get update
  sudo apt-get install zsh tmux git neofetch
  sudo locale-gen en_US.UTF-8
elif [[ $(uname -a) = *ARCH* ]]; then
  sudo pacman -Sy aurman
  sudo pacman -R grml-zsh-config
  aurman -S tmux git zsh-git neofetch
fi
mkdir ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

### Download dotfiles repo
git clone https://github.com/NeoTheOne/dotfiles $HOME/.dotfiles

### Change shell
sudo chsh -s /bin/zsh $USER

### Allow command scripts to be run
sudo chmod +x $HOME/.dotfiles/commands/*

### Rename/backup old/default dotfiles and create directories for the new ones
if [ -f $HOME/.zshrc ]; then
  if [ ! -d $HOME/.old ]; then
    mkdir $HOME/.old
  fi
  mv $HOME/.zshrc $HOME/.old/zshrc_old
fi
if [ -f $HOME/.bash_profile ]; then
  if [ ! -d $HOME/.old ]; then
    mkdir $HOME/.old
  fi
  mv $HOME/.bash_profile $HOME/.old/bash_profile_old
fi
if [ -f $HOME/.tmux.conf ]; then
  if [ ! -d $HOME/.old ]; then
    mkdir $HOME/.old
  fi
  mv $HOME/.tmux.conf $HOME/.old/tmux.conf_old
fi
if [ -f $HOME/.config/neofetch/config ]; then
  if [ ! -d $HOME/.old ]; then
    mkdir $HOME/.old
  fi
  mv $HOME/.config/neofetch/config $HOME/.old/neofetch_config_old
fi
if [ ! -d $HOME/.config/neofetch ]; then
  if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
  fi
  mkdir $HOME/.config/neofetch
fi
if [ -f $HOME/.ssh/authorized_keys ]; then
  if [ ! -d $HOME/.old ]; then
    mkdir $HOME/.old
  fi
  mv $HOME/.ssh/authorized_keys $HOME/.old/authorized_keys_old
fi
if [ ! -d $HOME/.ssh ]; then
  mkdir $HOME/.ssh
  chmod 700 $HOME/.ssh
fi

### Symlinks
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/neofetch/config $HOME/.config/neofetch/config
ln -s $HOME/.dotfiles/ssh/authorized_keys $HOME/.ssh/authorized_keys

### Authorized Keys permissions
chmod 600 $HOME/.ssh/authorized_keys

### Restart to apply changes to wm terminals
#sudo shutdown -r now
