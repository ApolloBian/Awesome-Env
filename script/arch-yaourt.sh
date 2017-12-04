grep 'archlinuxcn' /etc/pacman.conf
if [[ $? != 0 ]]; then
    echo '[archlinuxcn]' | sudo tee --append /etc/pacman.conf >> /dev/null
    echo '    SigLevel = Never' | sudo tee --append /etc/pacman.conf >> /dev/null
    echo '    Server = http://repo.archlinuxcn.org/$arch' | sudo tee --append /etc/pacman.conf >> /dev/null
fi
sudo pacman -Sy --needed yaourt fakeroot
