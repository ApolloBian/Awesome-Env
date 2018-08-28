# Awesome Env [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
![](https://img.shields.io/badge/version-stable-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/language-bash-green.svg?style=flat-square)
![](https://img.shields.io/badge/language-python-green.svg?style=flat-square)
![](https://img.shields.io/badge/platform-ArchLinux%20|%20macOS%20|%20Ubuntu-orange.svg?style=flat-square)

![](https://img.shields.io/badge/license-GPL_License-blue.svg?style=flat-square)
![](https://img.shields.io/github/last-commit/ApolloBian/Awesome-Env.svg?style=flat-square)

In order to set up working environment easily, and to share my configurations, I create this repo.

And I hope it will be awesome :penguin:

# Contents

 - [Get started](#get-started)
    - [Dependency](#dependency)
    - [Installation](#installation)
 - [Features](#features)

# Get started
## Installation
I provide 2 options for installation.
### 1. One-liner installation
In most cases this one-liner will do the job. If you lack certain privilleges or you want to make custom profiles, you should
consider [manual installation](#2-customizable-manual-installation).
```bash
# paste this to cmdline
# install to default dir (~/Awesome-Env)
bash <(curl -s \
    https://raw.githubusercontent.com/ApolloBian/Awesome-Env/master/online-bootstrap.sh)
```
If you want to install to a custom directory, use the following commands
```bash
# paste this to cmdline
# install to custom dir
INSTALL_DIR=$HOME/.Awesome-Env      # the dir that you want to install to
bash <(curl -s \
    https://raw.githubusercontent.com/ApolloBian/Awesome-Env/master/online-bootstrap.sh) \
    $INSTALL_DIR
```

### 2. Customizable manual installation
__Note__: this project uses git submodules, so you MUST clone this repo instead of downloading zipfile.

Esseintially, cmdline tools such as `git` and `curl` are required, also building toolchains are required
if you are to use some components that requires compiling (such as `core-vim_compile`)

Clone this repo to `~/Awesome-Env`. Execute the `install.py` script.
```bash
git clone https://github.com/ApolloBian/Awesome-Env.git ~/Awesome-Env
cd ~/Awesome-Env
python install.py
```

If you are working on a machine that you have admin(sudo) privileges, you can execute `./install.py` with no parameters.
This script will automatically detect your platform and choose suitable profiles for you.

However, if you are working on a server of which you don't have sudo privileges, or on which you need to install packages with caution,
you can add `--server` param when executing `./install.py`:
```bash
./install.py --server
```

You can choose the modules you need by modifying relative profiles. You can also make your own profiles and install with `--custom_profile` parameter:
```bash
./install.py --custom_profile profiles/Custom
```


# Features
 - Support multiple \*nix platforms using profiles
 - modulized design, easy to maintain, troubleshoot and expand

