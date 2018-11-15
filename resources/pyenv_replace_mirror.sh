#!/usr/bin/env bash
cd $(pyenv root)
pwd
sed -i -e 's/www.python.org\/ftp/npm.taobao.org\/mirrors/g' `ack 'www.python.org/ftp' -l`
cd -
