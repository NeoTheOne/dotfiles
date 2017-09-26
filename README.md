# dotfiles
Shameslessly stolen from https://github.com/gabelandau

All configs need to be sym-linked to their respective locations in your home folder.

## zsh
The zsh configuration uses the base zshrc file, as well as an alias file and theme file in the zsh directory. The config also uses antigen to manage plugins. It loads the oh-my-zsh framework, theme, and other plugins. One of the plugins loaded into the config is scm_breeze, which isn't available on antigen, so it must be installed on it's own.

## tmux
The tmux configuration has no dependencies, just the tmux.conf file.

# Installer
This repo includes a .sh script for symlinking and installing all necessary files. It is a work in progress, do not run it now.
