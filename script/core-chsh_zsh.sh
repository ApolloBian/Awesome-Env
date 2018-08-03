zsh=`which zsh`
if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    sudo chpass -s $zsh $USER
else
    sudo chsh -s $zsh $USER
fi
