# !/bin/bash
function talk () {
  clear -x
  echo ""
  echo $1
  echo ""
  cat ~/.nova/nova.txt
  sleep 1
}
