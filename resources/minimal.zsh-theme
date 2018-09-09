function reset_cursor() {
    # change cursur to underline
    # print -n '\033[0 q' block
    # print -n '\033[6 q' line cursor
    echo '\033[4 q'
}

CYAN_FG="%{$fg[cyan]%}"
RED_FG="%{$fg[red]%}"
BLACK_FG="%{$fg[black]%}"
RED_FG_BOLD="%{$fg_bold[red]%}"
GREEN_FG="%{$fg[green]%}"
WHITE_FG="%{$fg[white]%}"
YELLOW_FG="%{$fg[yellow]%}"
DARKGRAY_BG="%{$bg[yellow]%}"
BLUE_FG="%{$fg[blue]%}"
RESET_COLOR="%{$reset_color%}"
PROMPT='%(?.$BLACK_FG.$RED_FG$? )$RESET_COLOR%(!.#.$) > '
