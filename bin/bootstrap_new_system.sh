#!/usr/bin/env bash
dev="$HOME/oh-my-dotfiles"
pushd .
mkdir -p $dev
cd $dev

if [[ `uname` == 'Darwin' ]]; then
  echo 'Tweaking OS X...'
  which brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  sudo easy_install pip
  sudo -H pip install flake8 ipython
  brew update
  brew install htop ruby tmux cmake git fcitx-remote-for-osx
  open "https://github.com/CodeFalling/fcitx-remote-for-osx"
elif [[ `uname` == 'Linux' ]]; then
    # Need to detect sudo
    sudo -l
    if [[ $? == 0 ]]; then
        echo 'have sudo'
    else
        echo 'no sudo'
    fi
fi


echo 'Symlinking config files...'
bash 'bin/link_dotfiles.sh'
bash 'bin/vim.sh'

mkdir -p config/oh-my-zsh/custom/themes/
cp resources/custom.zsh-theme config/oh-my-zsh/custom/themes/
