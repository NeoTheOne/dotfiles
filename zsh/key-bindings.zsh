### Key-bindings for zsh

# Correct the escape sequence of the delete key on OSx in iTerm2
if [ '$TERM_PROGRAM == "iTerm.app"' ]; then
bindkey "^[[3~" delete-char
fi
