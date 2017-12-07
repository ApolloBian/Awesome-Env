if [[ `uname` == 'Darwin' ]]; then
    brew cask install p4merge
else
    # TODO:
    echo "Linux is not supported yet!"
    # install p4merge
fi


# Set env variable
if [[ `uname` == 'Darwin' ]]; then
    num_proc=8
    prefix=$HOME/Applications/
    p4merge_bin=$HOME/oh-my-dotfiles/resources/darwin-p4merge
else
    num_proc=`cat /proc/cpuinfo| grep "processor"| wc -l`
    prefix=$HOME/.local
    # TODO:
    # set p4merge_bin for linux
fi


bin=$prefix/bin
cp $p4merge_bin $bin/p4merge
