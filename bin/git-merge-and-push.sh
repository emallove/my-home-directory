#!/bin/sh 

# Echo commands to STDOUT
set -x

##################################################
#                                                #
#   Staging                                      #
#                                                #
##################################################

# git stash save "stash save automatically by [$_] $*"

# Use --no-edit to not invoke the editor

git checkout staging
git merge $* --no-edit
git push
# bundle exec cap staging deploy
exit

##################################################
#                                                #
#   Master                                       #
#                                                #
##################################################

# Use --no-edit to not invoke the editor
git checkout master
git merge $* --no-edit
git push
bundle exec cap production deploy

# Push to all branches

