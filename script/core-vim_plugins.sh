# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/
# TODO: multi-platform support

source $HOME/.env
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

export PATH=$HOME/.local/bin:$PATH
nvim +PlugInstall 8
# if [[ `uname` == 'Darwin' ]]; then
#     cp $HOME/.vim/bundle/fcitx.vim/so/fcitx.vim $HOME/.vim/bundle/fcitx.vim/plugin/
# fi
 
# TODO: maybe try space vim 
# echo "Installing Space-Vim ..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
