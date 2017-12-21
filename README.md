# Awesome Env [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
![](https://img.shields.io/badge/version-stable-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/language-bash-green.svg?style=flat-square)
![](https://img.shields.io/badge/language-python-green.svg?style=flat-square)
![](https://img.shields.io/badge/platform-ArchLinux%20|%20macOS%20|%20Ubuntu-orange.svg?style=flat-square)

![](https://img.shields.io/badge/license-GPL_License-blue.svg?style=flat-square)
![](https://img.shields.io/github/last-commit/ApolloBian/Awesome-Env.svg?style=flat-square)
![](https://img.shields.io/github/commit-activity/y/ApolloBian/Awesome-Env.svg?style=flat-square)

In order to set up working environment easily, and to share my configurations, I create this repo.

And I hope it will be awesome :penguin:

# Installation
## via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ApolloBian/oh-my-dotfiles/master/airboot.sh)"
```

# Reconstruction Plans
 - new branch: modulization
    - [x] system dependent profiles:
        - [x] Darwin 
        - [x] ArchLinux
        - [x] Server
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
    - [x] vimdiff3 for servers

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
 - [ ] zsh tweak
    - [x] autocompletion and highlighting
        - [ ] tweak highlighting
        - [ ] tweak autocompletion
 - [ ] fcitx for server profile
 - [ ] learn about vim tagbar
 - [ ] learn about vim scroll through buffer (Liu yu chen's dotfiles)
 - [ ] add menu in readme(using toc)
 - [ ] Ant
 - [ ] Boston
 - [x] system dependent settings
    - [Refer to this link!](https://github.com/Leoyzen/dotfiles)
    - [x]independent, editable enviroment ( which does not effect configurations on other machines)
 - [x] merge MaintainNotes into project wiki
 - [x] bundle latest version of vim
 - [x] submodule init
 - [x] finish vim related part:
    - vundle
    - ycm update submodule
 - [x] finish oh-my-zsh part:
    - move custom theme to oh-my-zsh/custom
 - [x] modulization
 - [x] ship latest version of vim !
 - [x] Rename project to awesome-env
 - [x] badges
    - [x] awesome
    - [x] badges: [shields.io](https://img.shields.io/) [简书链接](http://www.jianshu.com/p/e9ce56cb24ef)
 - [x] tmux 
    - [x] tmux 2.6
    - [x] outside $TERM: xterm-256color
    - [x] inside $TERM: xterm-256color
    - [x] termoverride
    - [x] try 2 versions of xterm-terminfo: from writer, from arch
        - conclusion: from writer
    - [x] infocmp -x > xterm-terminfo
    - [x] edit xterm-terminfo, add `Tc,`
    - [x] tic -o ~/.terminfo -x xterm-terminfo
