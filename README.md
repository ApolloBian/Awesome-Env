# Awesome Env [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
![](https://img.shields.io/badge/version-stable-lightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/language-bash-green.svg?style=flat-square)
![](https://img.shields.io/badge/language-python-green.svg?style=flat-square)
![](https://img.shields.io/badge/platform-ArchLinux%20|%20macOS%20|%20Ubuntu-lightgrey.svg?style=flat-square)

![](https://img.shields.io/badge/license-GPL_License-blue.svg?style=flat-square)
![](https://img.shields.io/commits/ApolloBian/Awesome-Env.svg?style=flat-square)
![](https://img.shields.io/github/last-commit/ApolloBian/Awesome-Env.svg?style=flat-square)
![](https://img.shields.io/github/commit-activity/y/ApolloBian/Awesome-Env.svg?style=flat-square)

In order to set up working environment easily, and to share my configurations, I create this repo.

And I hope it will be awesome

# Installation
## via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ApolloBian/oh-my-dotfiles/master/airboot.sh)"
```

# Reconstruction Plans
 - new branch: modulization
    - [ ] system dependent profiles:
        - [x] Darwin 
        - [ ] ArchLinux
        - [ ] Ubuntu
    - [x] oh-my-zsh
    - [x] vim
    - [ ] fonts
        - [ ] powerline(optional)
        - [ ] fira-mono, fira-code
    - [x] p4merge read this article : https://pempek.net/articles/2014/04/18/git-p4merge/
        - [x] gitconfig
        - [x] profile
        - [x] bin
    - [x] github desktop
    - [ ] smartgit
    - [ ] sourcetree

 - dir organization:
```
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
```


# TODO:
 - [ ] Rename project to awesome-env
 - [ ] badges
    - [x] awesome
    - [ ] badge template: https://img.shields.io/badge/<SUBJECT>-<STATUS>-<COLOR>.svg
 - [ ] learn about vim tagbar
 - [ ] learn about vim scroll through buffer (Liu yu chen's dotfiles)
 - [ ] add menu in readme(using toc)
 - [ ] Ant
 - [ ] Boston
 - [ ] system dependent settings
    - [Refer to this link!](https://github.com/Leoyzen/dotfiles)
    - [x]independent, editable enviroment ( which does not effect configurations on other machines)
 - [x] merge MaintainNotes into project wiki
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

