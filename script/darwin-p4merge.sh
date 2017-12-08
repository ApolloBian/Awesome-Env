brew cask install p4merge


# Set env variable
prefix=$HOME/Applications/
p4merge_bin=resources/darwin-p4merge

bin=$prefix/bin
cp $p4merge_bin $bin/p4merge
