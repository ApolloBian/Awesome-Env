#!/usr/bin/python
import os
import sys
currentpath = sys.path[0]
homepath = os.path.expanduser('~')
filetmp = os.listdir('.')
filetmp.remove('setup.py')
linkfiles= [os.path.join(homepath, ".%s" % name) for name in filetmp]
realfiles= [os.path.join(currentpath,  name) for name in filetmp]
for i in range(len(linkfiles)):
	cmd = "rm %s " % linkfiles[i]
	os.system(cmd)
	cmd = "ln -s %s %s" % (realfiles[i], linkfiles[i])
	os.system(cmd)

# setup vundle
os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
os.system("vim +PluginInstall +qall")
