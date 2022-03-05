if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[green]%}%n@%M%{$reset_color%}:%{$fg_bold[red]%}%~%{$reset_color%}$(git_prompt_info)$'
RPS1="${return_code}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

export DISABLE_AUTO_TITLE="true"

setopt extended_glob

function title() {
  a=${(V)1//\%/\%\%}
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $a in
    tmux*|ssh*|mosh*)
      return
    ;;
    *)
      print -Pn "\e]2;$a :: $2\a"
      case $TMUX in
        *tmux*)
          tmux rename-window "$(print -Pn "$a :: $2")"
        ;;
      esac
    ;;
  esac
}

function ssh() {
  case $TMUX in
    *tmux*)
      tmux rename-window "$*"
    ;;
  esac
  command ssh "$@"
}
function mosh() {
  case $TMUX in
    *tmux*)
      tmux rename-window "$*"
    ;;
  esac
  command mosh "$@"
}

function precmd {
  if [ $? -eq 0 ]; then
    RPROMPT="( ˃ ヮ˂)"
  else
    RPROMPT="(｡-人-｡)"
  fi

  title "zsh" "%m(%55<...<%~)"
}

function preexec {
  title "$1" "%m(%35<...<%~)"
}
