#!/usr/bin/env bash

basedir=`pwd`

# syntax files
mkdir -p ~/.vim/after/
ln -sf $basedir/resources/vim_extra/syntax ~/.vim/after

# filetype
ln -sf $basedir/resources/vim_extra/ftdetect ~/.vim/
