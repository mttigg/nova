# !/bin/bash
source ~/.nova/commands/git/configure.sh
source ~/.nova/commands/git/configure-github.sh
source ~/.nova/commands/git/install.sh
source ~/.nova/commands/internal/talk.sh
source ~/.nova/commands/node/install.sh
source ~/.nova/commands/vim/configure.sh
source ~/.nova/commands/vim/install.sh
source ~/.nova/commands/bash/configure.sh
source ~/.nova/commands/git/pull-mono.sh

function installDev() {
  talk "Initializing [.   ]"
  talk "Initializing [..  ]"
  talk "Initializing [... ]"
  talk "Initializing [....]"

  sleep 2

  talk "Hello!"

  talk "Let\'s set you up!"

  talk "Firstly you need git"
  installGit
  configureGit
  configureGitHub

  talk "Hmm... I guess you need Node.js, give me a second here.";
  installNode

  talk "Let\'s spruce up terminal experience"
  installVim
  configureVim
  configureBash

  talk "Okay..."

  talk "Only thing left is to pull the repository..."
  pullMono

  talk "I finished your setup"
  talk "I\'ll see you later";

  sleep 1
}
