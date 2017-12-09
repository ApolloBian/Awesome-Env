# generate terminfo 
rm -rf $HOME/.terminfo
tic -o $HOME/.terminfo -x resources/xterm-256color-tc
