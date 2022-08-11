# !/bin/bash
talk "Fetching Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
talk "Installing Node @16.15.0..."
nvm install 16.15.0
nvm default 16.15.0
