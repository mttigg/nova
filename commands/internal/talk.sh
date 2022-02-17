# !/bin/bash
function talk () {
  clear -x
  echo ""
  echo $1
  echo ""
  cat ~/.nova/ascii.txt
  sleep 1
}
