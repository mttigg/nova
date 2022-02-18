# !/bin/bash
echo "Configuring Git..."
sleep 1
echo ""
echo "What is your GitHub email?"
echo ""

read email

echo ""
echo "What is your GitHub username?"
echo ""

read username

git config --global user.name $username
git config --global user.email $email

echo "Git has been configured"
