#!/usr/bin/env bash
cd $(pyenv root)
pwd
sed -i -e 's/www.python.org\/ftp/npm.taobao.org\/mirrors/g' `ag 'www.python.org/ftp' -l`
sed -i -e 's/repo.continuum.io/mirrors.tuna.tsinghua.edu.cn\/anaconda/g' `ag 'repo.continuum.io' -l`
cd -
