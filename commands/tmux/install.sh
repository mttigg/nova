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

# !/bin/bash
talk "Installing dependencies..."
sudo yum install ncurses -y
sudo yum install ncurses-devel -y
sudo yum install libevent -y
sudo yum install libevent-devel -y
sudo yum install automake -y
sudo yum install make -y
sudo yum install bison -y
sudo yum install pkg-config -y
sudo yum install autoconf -y
sudo yum install gcc -y

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
