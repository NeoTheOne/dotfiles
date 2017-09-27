#================================
# zshrc path config
#================================

### Paths
# Path for gnu binaries for OSx via brew
if [[ -d $(brew --prefix coreutils)/libexec/gnubin ]]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
