#!/usr/bin/env python2.7
from __future__ import unicode_literals, print_function
import platform
import argparse
import logging
import os


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--no_sudo', default=False, action='store_true')
    parser.add_argument('--server', default=False, action='store_true')
    parser.add_argument('--profile', type=str, default=None)
    return parser.parse_args()


def detect_platform():
    uname = ' '.join(platform.uname())
    print(uname)
    return uname

def add_dirname(f):
    def f_w_name(*s):
        return os.path.join('./profiles', f(*s))
    return f_w_name

@add_dirname
def select_profile(uname, no_sudo, is_server):
    if is_server:
        return 'Server'
    if 'Ubuntu' in uname:
        if no_sudo:
            return 'Server'
        else:
            return 'Ubuntu'
    elif 'ARCH' in uname:
        return 'ArchLinux'
    elif 'Darwin' in uname:
        return 'Darwin'
    else:
        print('Unknown system uname: %s' % uname)


def parse_profile(profile_name):
    print("Reading profile: %s" % profile_name)
    with open(selected_profile) as f:
        configure = [line.split("#")[0] for line in f.readlines()]
    selected_modules = [line.split()[-1] for line in configure
                        if '[x]' in line]
    print("Listing selected modules for profile %s" % profile_name)
    list(map(print, selected_modules))

    selected_modules = map(lambda x: './script/%s.sh' % x, selected_modules)

    return selected_modules


if __name__ == '__main__':
    args = parse_args()
    os.system('git submodule update --init --recursive')
    """
    Installation sequence:
        1. Detect platform:
            What defines a platform? PACKAGE MANAGER
        2. Parse respective profiles, DEFAULT LOC: ./profiles
        3. according to parse result, execute a sequence of scripts
    """
    if not args.profile:
        # Detect platform
        uname = detect_platform()
        # Determine profile name
        selected_profile = select_profile(uname, args.no_sudo, args.server)
        print(selected_profile)
        if raw_input("confirm? [y/N]") != 'y': exit(0)
        # Parse profile
        if selected_profile is None:
            logging.error("Unrecognized system, please use custom profile!")
            exit()
    else:
        selected_profile = args.profile
    module_list = parse_profile(selected_profile)

    failed_script = []
    for i, module in zip(map(lambda script: os.system("bash %s" % script), module_list), module_list):
        if i != 0:
            failed_script.append(module)
    if failed_script:
        print("The following modules are not installed properly")
        for fs in failed_script:
            print(fs)
    else:
        print("Installation sucess!")
