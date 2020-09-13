# pip
if [[ `uname` == 'Darwin' ]]; then
    # Darwin
    pipdir=$HOME/Library/Application\ Support/pip
else
    pipdir=$HOME/.config/pip
fi
mkdir -p $pipdir
pipconfig=$pipdir/pip.conf

echo "
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com
" > $pipconfig
