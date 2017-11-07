#!/usr/bin/env bash

# fish_conf="$HOME/.config/fish/conf.d"

# if [[ -d "$dotfiles" ]]; then
#   echo "Symlinking dotfiles from $dotfiles"
# else
#   echo "$dotfiles does not exist"
#   exit 1
# fi

echo "Symlinking dotfiles in $(pwd)/dotfiles"

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

for file in $(find dotfiles -name '*'); do
  file="${file##*/}"
  # file="${file%.sh}"
  link "$(pwd)/dotfiles/$file" "$HOME/.$file"
done



# git config
# for git, I haven't came up with a good solution
cp config/gitconfig $HOME/.gitconfig
git config --global user.name Tianling@"$HOST"


rm -rf $HOME/.oh-my-zsh
ln -s $(pwd)/config/oh-my-zsh $HOME/.oh-my-zsh
touch ~/.local_env


# Link Fish Config
# for location in $(find home -name '*.fish'); do
#   file="${location##*/}"
#   echo $location, $file
#   link "$dotfiles/$location" "$fish_conf/$file"
# done

