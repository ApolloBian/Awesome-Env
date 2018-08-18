#!/usr/bin/env bash

user_launchd_dir=$HOME/Library/LaunchAgents/
mkdir -p $user_launchd_dir

ln -sf $(pwd)/resources/launchd-environment.plist $user_launchd_dir/environment.plist
