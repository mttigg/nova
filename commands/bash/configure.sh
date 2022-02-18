# !/bin/bash
function configureBash () {
  echo "-----Setting-up-Bash-----"
  echo "Moving DotFiles to user root..."
  cp ~/.nova/.bashrc ~/.bashrc
  cp ~/.nova/.toprc ~/.toprc
  echo "-----Setup-complete-----"
}
