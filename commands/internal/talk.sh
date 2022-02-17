# !/bin/bash
function talk () {
  clear -x
  cat ~/.nova/nova.txt
  echo ""
  echo $1
  echo ""
  sleep 1
}
