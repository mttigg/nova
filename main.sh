# !/bin/bash
source ~/.nova/commands/internal/talk.sh
source ~/.nova/login.sh

function nova() {
  if [ $1 == 'install:dev' ]
  then
    source ~/.nova/commands/install-dev.sh
  else
    talk "Hmm, I don't seem to recognize that command"
  fi
}
