# !/bin/bash
echo "-----Sprucing-Up-VIM-----"
echo "Installing Plugin Manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Fetching colorscheme..."
cd ~/git
git clone https://github.com/morhetz/gruvbox.git
echo "Adding colorscheme Directory..."
mkdir ~/.vim/colors
echo "Adding colorscheme to VIM..."
cp ~/git/gruvbox/colors/gruvbox.vim ~/.vim/colors/
echo "Installing LanguageServers..."
npm i -g typescript
echo "Installing tmux..."
sudo yum install ncurses
sudo yum install ncurses-devel
sudo yum install libevent
sudo yum install libevent-devel
sudo yum install automake
sudo yum install autoconf
sudo yum install gcc
cd ~/git
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install
cd ~
echo "Setting up tmux..."
cp ~/.nova/.tmux.conf ~/.tmux.conf
echo "-----Vim-Is-Now-Spruced-----\n\n"
