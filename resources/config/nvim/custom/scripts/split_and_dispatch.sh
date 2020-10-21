#!/usr/bin/env bash

cmd=$(python -c "
import os
import sys

if os.path.exists('vim_exec.sh'):
    print('bash vim_exec.sh')
elif os.path.exists('vim_test.sh'):
    print('bash vim_test.sh')
else:
    filename = sys.argv[-1]
    if os.path.exists(filename):
        ext = os.path.splitext(filename)[1]
        if ext == '.sh':
            print('bash ' + filename)
        elif ext == '.py':
            print('python ' + filename)
        else:
            print('failcmd')
    else:
        print('failcmd')
" $1 2>/dev/null)
echo $cmd

if [[ ! -z $TMUX ]]; then
    # tmux is connected
    # manipulate command according to existing files

    if [[ $cmd != 'failcmd' ]]; then
        tmux split-window -p 30 "pwd && echo $cmd && $cmd ; zsh"
    else
        pwd
        echo not supported operation
    fi
    # tmux split-window 'pyenv versions && zsh'
else
    # tmux is not connected
    $cmd
fi
