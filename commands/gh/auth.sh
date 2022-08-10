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
#       CREATED: 2022-08-06 03:19:48 AM
#      REVISION:  1
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

talk "Starting ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/gh
