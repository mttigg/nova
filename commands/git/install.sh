# !/bin/bash
function installGit () {
  echo "Installing Git..."
  sudo yum install git
  echo "Creating Git Directory..."
  mkdir ~/git
  echo "Git is now installed..."
  sleep 1
}
