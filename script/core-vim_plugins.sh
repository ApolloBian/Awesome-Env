# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/
# TODO: multi-platform support

# setting up vim plugins
source ~/.env
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer --js-completer
# uname -a | grep -i ubuntu
# if [[ $? != 0 ]]; then
#     ./install.py --clang-completer --system-libclang
# else
#     # download clang if on server
#     ./install.py --clang-completer
# fi


vim +PluginInstall
if [[ `uname` == 'Darwin' ]]; then
    cp $HOME/.vim/bundle/fcitx.vim/so/fcitx.vim $HOME/.vim/bundle/fcitx.vim/plugin/
fi
 

# TODO: maybe try space vim 
# echo "Installing Space-Vim ..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
