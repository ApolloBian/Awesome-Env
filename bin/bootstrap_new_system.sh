#!/usr/bin/env bash
# A simple script for setting up dev environment.

dev="$HOME/oh-my-dotfiles"
pushd .
mkdir -p $dev
cd $dev



sudo vim /etc/hosts

pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
[[ -f $pub ]] || ssh-keygen -t rsa


# echo 'Copying public key to clipboard. Paste it into your Github account...'
  # [[ -f $pub ]] && cat $pub | pbcopy
  # open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  echo 'Tweaking OS X...'
  which brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update
  brew install htop ruby tmux cmake git fcitx-remote-for-osx
  open "https://github.com/CodeFalling/fcitx-remote-for-osx"


# TODO: modify Linux part
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





# pyenv_dir=$HOME/.pyenv
# if [[ ! -d $pyenv_dir ]];then
#     echo "Pyenv not found, Installing..."
#     curl -L "https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer" | bash
# fi

# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher


echo 'Symlinking config files...'
source 'bin/link_dotfiles.sh'


# setting up vim 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall


# TODO: maybe try space vim 
# echo "Installing Space-Vim ..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"



# -------------- post install
mkdir -p dotfiles/oh-my-zsh/custom/themes
cp resources/custom.zsh-theme dotfiles/oh-my-zsh/custom/themes

# for git, I haven't came up with a good solution
git config --global user.name "Tianling@$HOST"
