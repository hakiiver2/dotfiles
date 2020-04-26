#!/bin/sh

sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
