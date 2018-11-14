#!/usr/bin/env bash
# TODO: install python3 using pyenv

# dependencies: https://github.com/pyenv/pyenv/wiki/common-build-problems
# please refer to this link if anything should go wrong
# rm -r $(pyenv root)/versions/x.x.x to remove specific python version

# ubuntu dependencies
# sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
# libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
# xz-utils tk-dev libffi-dev liblzma-dev libedit-dev

source resources/dotfiles/env

# PYTHON_CONFIGURE_OPTS
if [[ `uname` == 'Darwin' ]]; then
    conf_opts="--enable-framework --enable-shared"
else
    conf_opts="--enable-shared"
fi



which pyenv
if [[ $? == 0 ]]; then
    # pyenv installed
    env PYTHON_CONFIGURE_OPTS=$conf_opts pyenv install 2.7.15
    env PYTHON_CONFIGURE_OPTS=$conf_opts pyenv install 3.5.6
else
    echo 'pyenv not installed (properly?)'
    exit 1
fi
