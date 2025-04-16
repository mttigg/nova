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
  --prefix=$HOME \
  --enable-luainterp \
  --with-lua-prefix=/usr/include/lua5.1

talk "Preparing VIM installation..."
sudo make

talk "Installing VIM"
sudo make install

mkdir -p ~/.vim/pack/tpope/start

talk "Installing copilot, run ':help copilot' to configure"
git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim

talk "Installing comment support"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q

talk "Installing subversion support"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/abolish.git
vim -u NONE -c "helptags abolish/doc" -c q

talk "Installing async support"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/dispatch.git
vim -u NONE -c "helptags dispatch/doc" -c q

talk "Installing unix commands"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/eunuch.git
vim -u NONE -c "helptags eunuch/doc" -c q

talk "Installing database tooling"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/dadbod.git
vim -u NONE -c "helptags dadbod/doc" -c q
cd ~/.vim/pack/tpope/start
git clone https://github.com/kristijanhusak/vim-dadbod-ui.git
vim -u NONE -c "helptags vim-dadbod-ui/doc" -c q

talk "Installing status bar stuff"
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-flagship.git
vim -u NONE -c "helptags vim-flagship/doc" -c q

talk "Installing fugitive"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

talk "Installing some repeat stuff"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/repeat.git

talk "Installing github niceness"
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-rhubarb.git
vim -u NONE -c "helptags vim-rhubarb/doc" -c q

talk "Installing some smart defaults"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/sensible.git

talk "Installing suround support"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q

talk "Installing [q ]q mappings"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/unimpaired.git
vim -u NONE -c "helptags unimpaired/doc" -c q

talk "Installing better nerd tree"
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-vinegar.git

talk "Installing better nerd tree"
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/apathy.git

talk "Installing session management"
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-obsession.git
vim -u NONE -c "helptags vim-obsession/doc" -c q

talk "Installing prettier"
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/prettier/vim-prettier ~/.vim/pack/plugins/start/vim-prettier

talk "Installing a big fatty Coc"
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
vim -c "helptags coc.nvim/doc/ | q"
