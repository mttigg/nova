# !/bin/bash
function configureGitHub () {
  echo "Configuring GitHub..."
  email = $(git config user.email)
  echo "Generating SSH key for GitHub..."
  ssh-keygen -t ed25519 -C $email -f gh
  echo "Moving SSH Key To Storage (~/.ssh)..."
  mv gh ~/.ssh/
  echo "Setting SSH Key Permisions..."
  chmod 400 ~/.ssh/gh
  echo "Starting ssh-agent..."
  eval "$(ssh-agent -s)"
  echo "Adding SSH Key To Agent..."
  ssh-add ~/.ssh/gh
  echo "Add this public key to GitHub: https://github.com/settings/keys"
  cat gh.pub
  read -p "Press enter once you have entered in the key"
  echo "GitHub has been configured"
}
