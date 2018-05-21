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
echo 'index-url = https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple' >> "$pipconfig"
echo 'format = columns' >> "$pipconfig"
