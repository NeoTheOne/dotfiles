### Paths for zsh

# Path for gnu binaries for OSx
if [ '-d "$(brew --prefix coreutils)/libexec/gnubin"' ]; then
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
