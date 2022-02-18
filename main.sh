# !/bin/bash
~/.nova/login.sh
source ~/.nova/commands/internal/talk.sh

function nova() {
  if [$1 = "install:dev"]
  then
    ~/.nova/commands/install-dev.sh
  else
    talk "Hmm, I don't seem to recognize that command"
  fi
}
