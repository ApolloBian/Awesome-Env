#!/usr/bin/env bash

if [[ -z $1 ]]; then
    folder=Awesome-Env
else
    folder=$1
fi

installdir=$HOME/$folder
echo "Installing Awesome-Env to $installdir"

git clone https://github.com/ApolloBian/Awesome-Env.git $installdir
cd $installdir
python install.py
