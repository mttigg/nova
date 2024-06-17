#!/bin/bash -
#===============================================================================
#
#          FILE: authenticate.sh
#
#         USAGE: ./authenticate.sh
#
#   DESCRIPTION: adds keys to keychain
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mattison, 
#  ORGANIZATION: 
#       CREATED: 2024-06-17 17:19:48 AM
#      REVISION:  1
#===============================================================================
talk "installing gh cli for convenience"

mkdir temp
cd temp

curl -LO https://github.com/cli/cli/releases/download/v2.51.0/gh_2.51.0_linux_arm64.tar.gz
tar -xzf gh_2.51.0_linux_arm64.tar.gz
cd gh_2.51.0_linux_arm64
sudo cp bin/gh /usr/local/bin/

cd ../../
rm -rf temp
