#!/bin/bash
#================================
# Run this script to install configuration files and symlink them to the home directory
# Be sure to change $USERNAME to reflect the your username
#================================

# Variables
USER=glandau

# Symlinks
ln -s /Users/$USER/dotfiles/zsh/zshrc /Users/$USER/.zshrc
