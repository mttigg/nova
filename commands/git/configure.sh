# !/bin/bash
function configureGit () {
  echo "Configuring Git..."
  sleep 1
  echo "\nWhat is your GitHub email?\n"

  read email

  echo ""
  echo "\nWhat is your GitHub username?\n"
  echo ""

  read username

  git config --global user.name $username
  git config --global user.email $email

  echo "Git has been configured"
}
