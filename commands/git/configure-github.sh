# !/bin/bash
echo "Configuring GitHub..."
email=$(git config user.email)
echo ""

echo "Generating SSH key for GitHub..."
ssh-keygen -t ed25519 -C $email -f gh
echo ""

echo "Moving SSH Key To Storage (~/.ssh)..."
mv gh ~/.ssh/
echo ""

echo "Setting SSH Key Permisions..."
chmod 400 ~/.ssh/gh
echo ""

echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
echo ""

echo "Adding SSH Key To Agent..."
ssh-add ~/.ssh/gh
echo ""

echo ""
echo "Add this public key to GitHub: https://github.com/settings/keys"
echo ""
echo "Public key:"
cat gh.pub
echo ""

read -p "Press enter once you have entered in the key"

rm gh.pub

echo "GitHub has been configured"
