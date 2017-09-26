### Key-bindings for zsh

# Correct the escape sequence of the delete key on OSx in iTerm2
if [ 'uname == "Darwin"' ]; then
bindkey "^[[3~" delete-char
fi
