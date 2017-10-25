#!/usr/bin/env bash
# A simple script for setting up dev environment.


dev="$HOME/oh-my-dotfiles"
pushd .
mkdir -p $dev
cd $dev



sudo vim /etc/hosts

# pub=$HOME/.ssh/id_rsa.pub
# echo 'Checking for SSH key, generating one if it does not exist...'
# [[ -f $pub ]] || ssh-keygen -t rsa


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
  sudo easy_install pip
  sudo -H pip install flake8 ipython
  brew update
  brew install htop ruby tmux cmake git fcitx-remote-for-osx
  open "https://github.com/CodeFalling/fcitx-remote-for-osx"


# TODO: modify Linux part

elif [[ `uname` == 'Linux' ]]; then
    echo "Tweaking Linux, note that you should manage dependencies yourself!"
    wget -P /tmp https://dl.opendesktop.org/api/files/download/id/1508559201/Ant.tar.xz 
    xz -d /tmp/Ant.tar.xz
    tar -xvf /tmp/Ant.tar
    mkdir -p ~/.themes
    mv Ant ~/.themes/
    gsettings set org.gnome.desktop.interface gtk-theme Ant
    gsettings set org.gnome.desktop.wm.preferences theme Ant
    mkdir -p ~/.icons
    unzip resources/boston.zip
    mv Boston ~/.icons/
fi









echo 'Symlinking config files...'
sh 'bin/link_dotfiles.sh'

# pyenv_dir=$HOME/.pyenv
# if [[ ! -d $pyenv_dir ]];then
#     echo "Pyenv not found, Installing..."
#     curl -L "https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer" | bash
# fi

# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

mkdir -p config/oh-my-zsh/custom/themes/
cp resources/custom.zsh-theme config/oh-my-zsh/custom/themes/


# setting up vim 
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
vim +PluginInstall
if [[ `uname` == 'Darwin' ]]; then
    mv $HOME/.vim/bundle/fcitx.vim/so/fcitx.vim $HOME/.vim/bundle/fcitx.vim/plugin/
fi
 


# TODO: maybe try space vim 
# echo "Installing Space-Vim ..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"


