# pip
if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    pipdir=$HOME/Library/Application\ Support/pip
else
    pipdir=$HOME/.config/pip
fi
mkdir -p $pipdir
pipconfig=$pipdir/pip.conf
echo '[global]' > "$pipconfig"
echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> "$pipconfig"
