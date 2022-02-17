# !/bin/bash
function configureVim () {
  echo "-----Setting-up-Vim-----"
  echo "Moving DotFiles to user root..."
  cp ~/.nova/.vimrc ~/.vimrc
  echo "-----Setup-complete-----"
}
