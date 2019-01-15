# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/
# TODO: multi-platform support

if [[ `uname` == 'Darwin' ]]; then
    num_proc=8
else
    num_proc=`cat /proc/cpuinfo| grep "processor"| wc -l`
fi
echo $num_proc
source $HOME/.env
rm -rf $HOME/.vim/plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall $num_proc
# if [[ `uname` == 'Darwin' ]]; then
#     cp $HOME/.vim/bundle/fcitx.vim/so/fcitx.vim $HOME/.vim/bundle/fcitx.vim/plugin/
# fi
 
# TODO: maybe try space vim 
# echo "Installing Space-Vim ..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
