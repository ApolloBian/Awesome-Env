#!/usr/bin/env bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
bash resources/pyenv_replace_mirror.sh


# TODO: it appears we need to install conda separately for conda venv to work
if [[ `uname` == 'Darwin' ]]; then
    brew install miniconda
else
    # linux is not supported now
fi
