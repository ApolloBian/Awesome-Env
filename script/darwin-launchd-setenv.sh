#!/usr/bin/env bash

# for details of how this works, refer to the following links
# https://stackoverflow.com/questions/6337513/how-can-i-debug-a-launchd-script-that-doesnt-run-on-startup
# https://www.robjwells.com/2014/12/locale-in-os-x-and-launch-agents/
user_launchd_dir=$HOME/Library/LaunchAgents/
mkdir -p $user_launchd_dir

ln -sf $(pwd)/resources/launchd-environment.plist $user_launchd_dir/environment.plist
