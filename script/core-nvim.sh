#!/usr/bin/env bash
if [[ `uname` == 'Darwin' ]]; then
    brew install --HEAD luajit
    brew install --HEAD neovim
    /usr/local/bin/python3 -m pip install pynvim
else
    # linux
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P /tmp
    mkdir -p $HOME/.local/
    cd /tmp
    tar xvf nvim-linux64.tar.gz
    rsync -av /tmp/nvim-linux64/ $HOME/.local/
    cd -
fi
