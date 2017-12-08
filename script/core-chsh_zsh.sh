if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    chpass -s /bin/zsh $USER
else
    chsh -s /usr/bin/zsh $USER
fi
