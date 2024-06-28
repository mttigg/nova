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
sudo yum install ncurses -y
talk "Installing dependencies... ncurses"
sudo yum install ncurses-devel -y
talk "Installing dependencies... libevent"
sudo yum install libevent -y
sudo yum install libevent-devel
talk "Installing dependencies... automake"
sudo yum install automake -y
sudo yum install autoconf -y
talk "Installing dependencies... gcc"
sudo yum install gcc -y
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

talk "Installing copilot"

git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim
