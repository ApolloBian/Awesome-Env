# set easy_install, pip to use pypi.douban.com
# easy_install
pydistutils_cfg=$HOME/.pydistutils.cfg
echo '[easy_install]' > $pydistutils_cfg
echo 'index-url = https://pypi.douban.com/pypi/simple' >> $pydistutils_cfg
# pip
mkdir $HOME/.pip/
pipconf=$HOME/.pip/pip.conf
echo '[global]' > $pipconf
echo 'index-url = https://pypi.douban.com/pypi/simple' >> $pipconf
