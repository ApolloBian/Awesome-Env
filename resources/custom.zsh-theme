function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | command grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  else
    STATUS=" $STATUS$ZSH_THEME_GIT_PROMPT_PUSHED"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function touchbar_git_status() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS↑"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS●"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS◐"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS○"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | command grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS✗"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  else
    STATUS=" $STATUS✓"
  fi

  echo "‹$(my_current_branch)$STATUS›"
}

function my_current_branch() {
  echo $(git_current_branch || echo "(no branch)")
}

function ssh_connection() {
   if [[ -n $SSH_CONNECTION ]]; then
     echo "%{$fg[red]%}ssh://$RESET_COLOR"
   fi
}

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$reset_color%}"


ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[white]%}‹%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_PUSHED="%{$fg_bold[cyan]%}✓"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$fg_bold[white]%}›%{$reset_color%}"





# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})‹%*›%{$reset_color%}"
time_disabled="%{$fg[green]%}<%*>%{$reset_color%}"
time=$time_enabled


# PROMPT=$'${time}$(ssh_connection)$USER_SERVER$PATH_PROMPT_USER$(my_git_prompt)$CMD_PROMPT'
PROMPT=$'${time} $PATH_PROMPT_SHORT$(my_git_prompt)$CMD_PROMPT'

CYAN_FG="%{$fg[cyan]%}"
RED_FG="%{$fg[red]%}"
RED_FG_BOLD="%{$fg_bold[red]%}"
GREEN_FG="%{$fg[green]%}"
WHITE_FG="%{$fg[white]%}"
YELLOW_FG="%{$fg[yellow]%}"
BLUE_FG="%{$fg[blue]%}"
RESET_COLOR="%{$reset_color%}"
# BLUE_FG="%{$FG[033]%}"
# YELLOW_FG="%{$FG[226]%}"
# GREEN_FG="%{$FG[040]%}"

NEW_LINE=$'\n'
CMD_PROMPT="$WHITE_FG %(!.#.$) $RESET_COLOR $NEW_LINE"
# CMD_PROMPT="$WHITE_FG %(!.#.$) %{$reset_color%}"
# CMD_PROMPT="$RED_FG_BOLD | %{$reset_color%}"
USER_SERVER="$CYAN_FG%n@%m:$RESET_COLOR"
PATH_PROMPT_SHORT="$RESET_COLOR%c$RESET_COLOR"
PATH_PROMPT_USER="$RESET_COLOR%~$RESET_COLOR"
PATH_PROMPT_FULL="$BLUE_FG%/$RESET_COLOR"
