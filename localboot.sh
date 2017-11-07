dir="$HOME/oh-my-dotfiles"
cd $dir
git submodule update --init --recursive
bash bin/bootstrap_new_system.sh
