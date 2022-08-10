# !/bin/bash
talk "Initializing [..  ]"
talk "Initializing [... ]"
talk "Initializing [....]"
sleep 1

talk "Hello!"
sleep 1

talk "Let's set you up!"

talk "Firstly you need git"
source ~/.nova/commands/git/install.sh
source ~/.nova/commands/git/configure.sh
sleep 1

talk "Secondly github"
source ~/.nova/commands/gh/configure.sh
sleep 1

talk "Hmm... I guess you need Node.js, give me a second here.";
source ~/.nova/commands/node/install.sh
sleep 1

talk "Let's spruce up your terminal experience"
source ~/.nova/commands/tmux/install.sh
source ~/.nova/commands/vim/install.sh
source ~/.nova/commands/vim/configure.sh
source ~/.nova/commands/bash/configure.sh
sleep 1

talk "Okay..."

talk "Only thing left to do is pull the repository..."
source ~/.nova/commands/git/pull-mono.sh
sleep 1

talk "I finished your setup"
talk "I'll see you later";
sleep 1
