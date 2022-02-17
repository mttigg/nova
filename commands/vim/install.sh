# !/bin/bash
function installVim () {
  echo "-----Sprucing-Up-VIM-----"
  echo "Installing Plugin Manager..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Fetching colorscheme..."
  git clone https://github.com/morhetz/gruvbox.git
  echo "Adding colorscheme Directory..."
  mkdir ~/.vim/colors
  echo "Adding colorscheme to VIM..."
  cp ~/git/gruvbox/colors/gruvbox.vim ~/.vim/colors/
  echo "Installing LanguageServers..."
  npm i -g typescript
  echo "Installing tmux..."
  sudo yum install tmux
  echo "-----Vim-Is-Now-Spruced-----\n\n"
}
