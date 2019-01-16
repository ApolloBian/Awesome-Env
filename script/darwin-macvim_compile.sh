# Some futher references:
# http://liuchengxu.org/posts/use-vim-as-a-python-ide/


# Setup compile env variable according to plafrorm
# compile vim
if [[ `uname` == 'Darwin' ]]; then
    num_proc=8
else
    echo "macvim only compiles on mac"
    exit
fi
echo $num_proc


cd resources/macvim/src
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-cscope \
    --with-compiledby=bian_tianling@sjtu.edu.cn && \
make -j`num_proc`

mv ./MacVim/build/Release/MacVim.app $HOME/Applications/
