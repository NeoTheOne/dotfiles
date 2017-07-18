#!/bin/bash
#================================
# Run this script to install configuration files and symlink them to the home directory
#================================

### Create repos directory for antigen and other dependencies
mkdir repos

### Download dependencies
# Antigen
git clone https://github.com/zsh-users/antigen.git $HOME/dotfiles/repos
# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### Rename/backup old/default dotfiles
mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.bash_profile $HOME/.bash_profile_old
mv $HOME/.vimrc $HOME/.vimrc_old

### Symlinks
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
