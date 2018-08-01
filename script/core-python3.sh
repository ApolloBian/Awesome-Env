# arch
which pacman
if [[ $? == 0 ]]; then
    sudo pacman -S --needed python3
fi
# ubuntu
which apt-get
if [[ $? == 0 ]]; then
    sudo apt-get install python3
fi

# TODO: mac python3
