# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/
# TODO: multi-platform support



# compile vim
if [[ `uname` == 'Darwin' ]]; then
    # Set compile flags here
    num_proc=8
else
    python_config_dir=/usr/bin/python2.7/$(ls /usr/bin/python2.7 | grep ^config)
    num_proc=$(cat /proc/cpuinfo| grep "processor"| wc -l)
fi
echo $num_proc
cd $HOME/oh-my-dotfiles/resources/vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=$python_config_dir \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-cscope \
    --prefix=$HOME/.local/

#     --enable-gui=gtk2 \
make -j$(num_proc)
make install
