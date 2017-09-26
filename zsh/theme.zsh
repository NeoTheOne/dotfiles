if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

NEWLINE=$'\n'
PROMPT='%{$fg_bold[green]%}%n@%M%{$reset_color%}:%{$fg_bold[red]%}%~%{$reset_color%}$(git_prompt_info)$ '

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

setopt extended_glob

function precmd {
        if [ $? -eq 0 ]; then
                RPROMPT="( ˃ ヮ˂)"
        else
                RPROMPT="(◞ ‸ ◟ㆀ)"
        fi

    title "zsh" "%m(%55<...<%~)"
}

function preexec {
    title "$1" "%m(%35<...<%~)"
}

function title() {
  a=${(V)1//\%/\%\%}

  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\e]2;$a :: $2\a" # plain xterm title
    print -Pn "\ek$a\e\\"      # screen title (in ^A")
    print -Pn "\e_$2   \e\\"   # screen location
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$a :: $2\a" # plain xterm title
    ;;
  esac
}
