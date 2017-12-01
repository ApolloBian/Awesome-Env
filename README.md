# This is my dotfiles repo
In order to set up working environment easily, and to share my configurations, I create this repo.

# Installation
## via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ApolloBian/oh-my-dotfiles/master/install.sh)"
```

# Reconstruction Plans
 - new branch: modulization
    - [ ] system dependent profiles:
        - [ ] macos
    - [ ] oh-my-zsh
    - [ ] vim
    - [ ] termbase

 - dir organization:?
    oh-my-dotfiles
    |_install.sh
    |_update_config.sh
    |_profile : modules -> script
    | |_macos
    | |_ubuntu
    | |_archlinux
    |
    |_script (module installation)
    | |_foo.sh
    |
    |_resources
    | |_vim8.0
    | |_oh-my-zsh
    | |_gitconfig    
    | |_fonts
    | | |_powerline-fonts (not necessary if using lightline)
    | | 
    | |_icons
    | |_themes



# TODO:
 - [x] bundle latest version of vim
 - [x] submodule init
 - [x] finish vim related part:
    - vundle
    - ycm update submodule
    - fcitx
 - [x] finish oh-my-zsh part:
    - move custom theme to oh-my-zsh/custom
 - [x] modulization
 - [x] ship latest version of vim !

 - [ ] learn about vim tagbar
 - [ ] learn about vim scroll through buffer (Liu yu chen's dotfiles)
 - [ ] Ant
 - [ ] Boston
 - [ ] system dependent settings
    - [Refer to this link!](https://github.com/Leoyzen/dotfiles)
    - [x]independent, editable enviroment ( which does not effect configurations on other machines)
 - [ ] merge MaintainNotes into README.md
