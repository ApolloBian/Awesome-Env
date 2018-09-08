function reset_cursor() {
    # change cursur to underline
    # print -n '\033[0 q' block
    # print -n '\033[6 q' line cursor
    print -n '\033[3 q'
}

CYAN_FG="%{$fg[cyan]%}"
RED_FG="%{$fg[red]%}"
RED_FG_BOLD="%{$fg_bold[red]%}"
GREEN_FG="%{$fg[green]%}"
WHITE_FG="%{$fg[white]%}"
YELLOW_FG="%{$fg[yellow]%}"
DARKGRAY_BG="%{$bg[yellow]%}"
BLUE_FG="%{$fg[blue]%}"
RESET_COLOR="%{$reset_color%}"
PROMPT="%(?.%{$fg[black]%}.%{$fg[red]%}) %(!.#.$) > %{$reset_color%}$(reset_cursor)"
