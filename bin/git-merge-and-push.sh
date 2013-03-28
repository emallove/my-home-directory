#!/bin/sh 

# Use --no-edit to not invoke the editor
git checkout staging
git merge $* --no-edit

# Use --no-edit to not invoke the editor
git checkout master
git merge $* --no-edit

# Push to all branches
git push

bundle exec cap production deploy
bundle exec cap staging deploy
