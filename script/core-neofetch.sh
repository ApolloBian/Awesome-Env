#!/usr/bin/env bash
# 0. dependencies
brew install imagemagick

neo_config_root=~/.config/neofetch

# 1. make config dir
mkdir -p $neo_config_root
mkdir -p $neo_config_root/img
# 2. link files (config and img)

ln -sf $(pwd)/resources/neofetch_config.conf $neo_config_root/config.conf
ln -sf $(pwd)/resources/pictures/neofetch_* $neo_config_root/img/

# 3. install
if [[ `uname` == 'Darwin' ]]; then
    prefix=$HOME/Applications/
else
    prefix=$HOME/.local
fi
workdir=$(pwd)
cd $(pwd)/resources/neofetch/
make PREFIX=$prefix install
cd $workdir
echo "neofetch" >> ~/.local_env
