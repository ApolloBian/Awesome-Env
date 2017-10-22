dir="$HOME/oh-my-dotfiles"
echo "Cloning oh-my-dotfiles"
git clone --recursive https://github.com/ApolloBian/oh-my-dotfiles.git 

cd $dir
bash bin/bootstrap_new_system.sh
