# !/bin/bash
source ~/.nova/commands/talk.sh

function nova() {
  if source "${HOME}/.nova/commands/${2}/${1}.sh"
  then
    sleep 1 
    talk "successfully ${1}ed ${2}"
  elif source "${HOME}/.nova/commands/${1}.sh ${2}"
  then
    sleep 1 
    talk "successfully ${1}ed"
  else
    if !tree
    then
      sudo yum install tree
    fi
    talk "Did you mean one of the following commands?"
    tree "${HOME}/.nova/commands"
  fi
}
