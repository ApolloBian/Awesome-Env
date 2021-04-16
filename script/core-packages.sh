if [[ `uname` == 'Darwin' ]]; then
    bash ./script/darwin-brew.sh
    brew install miniconda
    bash ./script/darwin-brew_package.sh
else
    # linux is not supported now
    which apt-get
    if [[ $? == 0 ]]; then
        # use apt-get
        sudo apt-get install -y silversearcher-ag
        sudo apt-get install -y python3-pip
        sudo /usr/bin/pip3 install pynvim
        # node, required by nvim
        curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
fi
