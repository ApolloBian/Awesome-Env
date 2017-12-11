zsh=`which zsh
if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    chpass -s $zsh $USER
else
    chsh -s $zsh $USER
fi
