# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/


# Setup compile env variable according to plafrorm
# compile vim
if [[ `uname` == 'Darwin' ]]; then
    # Set compile flags here
    num_proc=8
    prefix=$HOME/Applications/
else
    num_proc=`cat /proc/cpuinfo| grep "processor"| wc -l`
    prefix=$HOME/.local
fi
# python_config_dir=/usr/lib/python2.7/`ls /usr/lib/python2.7 | grep ^config`
# echo $python_config_dir
echo $num_proc
echo $prefix


cd resources/vim
# make uninstall
make distclean
make clean
# if gui is desired, add this option in configure 
    # --enable-gui \
    # --disable-darwin \
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-cscope \
    --prefix=$prefix \
    --with-compiledby=bian_tianling@sjtu.edu.cn && \
make -j`num_proc` && \
make install
