#!/usr/bin/env bash
which brew
if [[ $? != 0 ]]; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
