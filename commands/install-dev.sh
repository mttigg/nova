# !/bin/bash
talk "Initializing [..  ]"
talk "Initializing [... ]"
talk "Initializing [....]"
sleep 1

talk "Hello!"
sleep 1

talk "Let's set you up!"

talk "Firstly you need git"
~/.nova/commands/git/install.sh
~/.nova/commands/git/configure.sh
~/.nova/commands/git/configure-github.sh
sleep 1

talk "Hmm... I guess you need Node.js, give me a second here.";
~/.nova/commands/node/install.sh
sleep 1

talk "Let's spruce up terminal experience"
~/.nova/commands/vim/install.sh
~/.nova/commands/vim/configure.sh
~/.nova/commands/bash/configure.sh
sleep 1

talk "Okay..."

talk "Only thing left is to pull the repository..."
~/.nova/commands/git/pull-mono.sh
sleep 1

talk "I finished your setup"
talk "I'll see you later";
sleep 1
