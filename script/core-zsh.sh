# arch
which pacman
if [[ $? == 0 ]]; then
    sudo pacman -S --needed zsh
fi
# ubuntu
which apt-get
if [[ $? == 0 ]]; then
    sudo apt-get install zsh
fi

# darwin
# zsh is shipped with macos
# no need to install
