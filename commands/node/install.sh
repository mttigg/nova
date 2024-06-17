# !/bin/bash
talk "Fetching Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
talk "Installing "
nvm install --lts
