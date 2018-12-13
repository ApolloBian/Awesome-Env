function reset_cursor() {
    # change cursur to underline
    # print -n '\033[0 q' block
    print -n '\033[4 q' # line cursor
    # echo '\033[4 q'
}

short_pwd() {
    cwd=$(pwd | sed "s|^$HOME|~|" | perl -F/ -ane 'print join( "/", map { $i++ < @F - 1 ?  substr $_,0,1 : $_ } @F)')
    echo -n $cwd
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

# setopt prompt_subst
PROMPT='%(?.$WHITE_FG.$RED_FG)%m:$(short_pwd)$(reset_cursor)
%* %(!.#.$) > $RESET_COLOR'
# PROMPT='$WHITE_FG%m:$(short_pwd)$RESET_COLOR
# %(?.$WHITE_FG.$RED_FG)%* %(!.#.$) > $RESET_COLOR'
# %(?.$BLACK_FG.$RED_FG$?)$RESET_COLOR %* %(!.#.$) > '
