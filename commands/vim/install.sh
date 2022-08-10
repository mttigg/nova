#!/bin/bash -
#===============================================================================
#
#          FILE: install.sh
#
#         USAGE: ./install.sh
#
#   DESCRIPTION: vim installation
#
#       OPTIONS: ---
#  REQUIREMENTS: amazon linux 2, pyenv
#          BUGS: ---
#         NOTES: 
#        AUTHOR: Mattison Greff, 
#  ORGANIZATION: 
#       CREATED: 2022-08-06 01:30:48 AM
#      REVISION:  1
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
talk "Installing Plugin Manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
talk "Fetching colorscheme..."
cd ~/git
git clone https://github.com/morhetz/gruvbox.git
talk "Adding colorscheme Directory..."
mkdir ~/.vim/colors
talk "Adding colorscheme to VIM..."
cp ~/git/gruvbox/colors/gruvbox.vim ~/.vim/colors/
talk "Installing LanguageServers..."
npm i -g typescript typescript-language-server
talk "Installing dependencies..."
sudo yum install ncurses
talk "Installing dependencies... ncurses"
sudo yum install ncurses-devel
talk "Installing dependencies... libevent"
sudo yum install libevent
sudo yum install libevent-devel
talk "Installing dependencies... automake"
sudo yum install automake
sudo yum install autoconf
talk "Installing dependencies... gcc"
sudo yum install gcc
talk "Installing dependencies... python3.4"
pyenv install 3.4.10

cd ~/git
git clone https://github.com/vim/vim.git
cd vim/src
talk "Cloning VIM repository..."
cd ~/git
git clone https://github.com/vim/vim.git
cd vim/src
talk "Configuring VIM installation..."
sudo ./configure \
  --with-features=huge \
  --enable-fail-if-missing \
  --enable-largefile \
  --enable-multibyte \
  --enable-python3interp \
  --with-python3-command=$HOME/.pyenv/versions/3.4.10/bin/python3.4 \
  --with-python3-config-dir=$HOME/.pyenv/versions/3.4.10/lib/python3.4/config-3.4 \
  --prefix=$HOME

talk "Preparing VIM installation..."
sudo make

talk "Installing VIM"
sudo make install
