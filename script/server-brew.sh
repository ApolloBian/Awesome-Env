source resources/dotfiles/env
which brew
if [[ $? != 0 ]]; then
    # install a tmp version of ruby 2.3.5
    rm -rf /tmp/tianling/
    rm -rf /home/linuxbrew/.linuxbrew
    rm -rf $HOME/.linuxbrew
    mkdir -p /tmp/tianling/
    cd /tmp/tianling/
    wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz
    tar -xvf ruby-2.3.5.tar.gz
    cd ruby-2.3.5
    ./configure --prefix=/tmp/tianling/
    make -j`cat /proc/cpuinfo | grep processor | wc -l`
    make install
    export PATH=/tmp/tianling/bin/:$PATH

    # install brew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
fi
brew update
brew install ruby
