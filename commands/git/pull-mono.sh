# !/bin/bash
function pullMono () {
  echo "-----Pulling-Work-Resources-----"
  echo "Cloning Work Repositories..."
  cd ~/git
  git clone git@github.com:meetgradient/hangar-bay.git
  cd ~
  echo "-----Work-Resources-Pulled-----\n\n"
}
