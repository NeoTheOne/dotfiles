#==================
# zshrc path config
#==================

### Paths
if [[ $(uname -a) = *Darwin* ]]; then
  # Path for gnu binaries for OSx via brew
  if [[ -d $(brew --prefix coreutils)/libexec/gnubin ]]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  fi
elif [[ $(uname -a) = *Debian* ]]; then
elif [[ $(uname -a) = *Ubuntu* ]]; then
fi
