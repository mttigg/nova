#!/bin/bash -
#===============================================================================
#
#          FILE: install.sh
#
#         USAGE: ./install.sh
#
#   DESCRIPTION: tmux installation
#
#       OPTIONS: ---
#  REQUIREMENTS: amazon linux 2
#          BUGS: ---
#         NOTES: not ran on a machine yet
#        AUTHOR: Mattison Greff, 
#  ORGANIZATION: 
#       CREATED: 2022-08-06 01:30:48 AM
#      REVISION:  1
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

# !/bin/bash
talk "Installing dependencies..."
sudo yum install ncurses
sudo yum install ncurses-devel
sudo yum install libevent
sudo yum install libevent-devel
sudo yum install automake
sudo yum install make
sudo yum install bison
sudo yum install pkg-config
sudo yum install autoconf
sudo yum install gcc

talk "Installing Tmux..."
mkdir ~/git
cd ~/git
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install

cd ~
talk "Setting up tmux..."
cp ~/.nova/.tmux.conf ~/.tmux.conf
talk "-----Tmux-Is-Now-Installed-----\n\n"
