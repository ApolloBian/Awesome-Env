sudo pacman -S --needed gdm
sudo systemctl disable display-manager.service
sudo systemctl enable gdm.service
