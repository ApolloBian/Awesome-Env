#!/usr/bin/env bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="/home/biantianling/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
bash resources/pyenv_replace_mirror.sh


# TODO: it appears we need to install conda separately for conda venv to work
if [[ `uname` == 'Darwin' ]]; then
    brew install miniconda
else
    echo linux is not supported now
fi
