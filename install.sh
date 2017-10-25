dir="$HOME/oh-my-dotfiles"
echo "Cloning oh-my-dotfiles"
git clone --recursive git@github.com:ApolloBian/oh-my-dotfiles.git
git submodule update --init --recursive

cd $dir
bash bin/bootstrap_new_system.sh
