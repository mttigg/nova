# !/bin/bash
talk "Configuring GitHub..."
email=$(git config user.email)

talk "Generating SSH key for GitHub..."
ssh-keygen -t ed25519 -C $email -f gh

talk "Moving SSH Key To Storage (~/.ssh)..."
mv gh ~/.ssh/

talk "Setting SSH Key Permisions..."
chmod 400 ~/.ssh/gh

talk "Starting ssh-agent..."
eval "$(ssh-agent -s)"

talk "Adding SSH Key To Agent..."
ssh-add ~/.ssh/gh

talk "Add this public key to GitHub: https://github.com/settings/keys\nPublic key:"
cat gh.pub

read -p "Press enter once you have entered in the key"

rm gh.pub

talk "GitHub has been configured"
