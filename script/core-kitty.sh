#!/usr/bin/env bash
# 0. install kitty
# more installation details refer to : https://sw.kovidgoyal.net/kitty/binary.html
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

kitty_config_root=~/.config/kitty

# 1. make config dir
mkdir -p $kitty_config_root

# 2. link files (config and img)
ln -sf $(pwd)/resources/kitty_config.conf $kitty_config_root/kitty.conf
