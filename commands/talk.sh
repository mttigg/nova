# !/bin/bash
function talk () {
  clear -x
  cat ~/.nova/nova.txt
  echo ""
  echo $1
  if $2
  then
    echo $2
  fi
  if $3
  then
    echo $3
  fi
  echo ""
  sleep 1
}
