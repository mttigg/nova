# !/bin/bash
echo "-----Adding-Node-Environment-----"
echo "Fetching Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
echo "Installing Node @12.19.0..."
nvm install 12.19.0
echo "-----Node-Environment-Added-----\n\n"
