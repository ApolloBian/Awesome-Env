# pip
if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    pipdir=$HOME/Library/Applicatiou\ Support/pip/
    mkdir -p $pipdir
else
    pipdir=$HOME/.config/pip/
    mkdir -p $pipdir
fi
pipconf=$pipdir/pip.conf
echo '[global]' > $pipconf
echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> $pipconf
