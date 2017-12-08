brew cask install p4merge


# Set env variable
prefix=$HOME/Applications/
p4merge_bin=$HOME/oh-my-dotfiles/resources/darwin-p4merge

bin=$prefix/bin
cp $p4merge_bin $bin/p4merge
