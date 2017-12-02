# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/
# TODO: multi-platform support



# compile vim

# cd $HOME/oh-my-dotfiles/resources/vim
# ./configure --with-features=huge \
#     --enable-multibyte \
#     --enable-rubyinterp=yes \
#     --enable-pythoninterp=yes \
#     --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#     --enable-perlinterp=yes \
#     --enable-luainterp=yes \
#     --enable-gui=gtk2 \
#     --enable-cscope \
#     --prefix=$HOME/oh-my-dotfiles/app/vim/
# 
# make -j$(cat /proc/cpuinfo| grep "processor"| wc -l)
# make install


# setting up vim plugins
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
