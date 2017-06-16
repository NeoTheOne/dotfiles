# dotfiles
This is a collection of all my dotfiles that I use in my development environments. I have included my zshrc, bash_profile (which is just used to open zsh), vimrc, and tmux.conf. I will uploading more as I clean them up and make them look somewhat presentable.

All configs need to be sym-linked to their respective locations in your home folder. I will be writing a script to do this automatically in the future.

## zsh
The zsh configuration uses the base zshrc file, as well as an alias file and theme file in the zsh directory. The config also uses antigen to manage plugins. It loads the oh-my-zsh framework, theme, and other plugins. One of the plugins loaded into the config is scm_breeze, which isn't available on antigen, so it must be installed on it's own. 

## vim
The vim configuration relies on pathogen for runtime configuration and vundle to manage plugins. Everything is loaded from the vimrc file.

## tmux
The tmux configuration has no dependencies, just the tmux.conf file.
