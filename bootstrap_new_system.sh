#!/usr/bin/env bash
# A simple script for setting up dev environment.

dev="$HOME/.dotfiles"
pushd .
mkdir -p $dev
cd $dev


pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f $pub ]] || ssh-keygen -t rsa

# echo 'Copying public key to clipboard. Paste it into your Github account...'
  # [[ -f $pub ]] && cat $pub | pbcopy
  # open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew install htop ruby grc fish tmux macvim cmake git
      echo 'export PATH="/usr/local/bin:$PATH"' >>~/.bashrc
      echo 'export MANPATH="/usr/local/share/man:$MANPATH"' >>~/.bashrc
      echo 'export INFOPATH="/usr/local/share/info:$INFOPATH"' >>~/.bashrc
  fi

  # echo 'Tweaking OS X...'
    # source 'etc/osx.sh'

elif [[ `uname` == 'Linux' ]];then
    which brew
    if [[ $? != 0 ]];then
        echo 'Installing Linux Brew...'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
        echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$HOME/.linuxbrew/bin:$PATH"' >>~/.bashrc
        echo 'export MANPATH="/home/linuxbrew/.linuxbrew/bin:$HOME/.linuxbrew/share/man:$MANPATH"' >>~/.bashrc
        echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/bin:$HOME/.linuxbrew/share/info:$INFOPATH"' >>~/.bashrc
        source ~/.bashrc
        brew update
        brew install htop ruby grc fish tmux vim cmake git
    fi
fi

pyenv_dir=$HOME/.pyenv
if [[ ! -d $pyenv_dir ]];then
    echo "Pyenv not found, Installing..."
    curl -L "https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer" | bash
fi

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher


echo 'Symlinking config files...'
  source 'bin/symlink-dotfiles.sh'

echo "Installing Space-Vim ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"

echo "Installing Fisherman Plugin"
fish -c "fisher fzf omf/brew omf/extract fzf pyenv homebrew-tap omf/theme-bobthefish grc"

if [[ ! -d $HOME/.local/share/omf ]];then
    echo "Installing Oh My Fish and Fisherman"
    curl -L https://get.oh-my.fish | fish
fi
