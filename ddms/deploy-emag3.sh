#!/bin/bash
set -x
PROJECT=~/sites/ddms-emag3
BRANCH=emag-issue3.2

cd $PROJECT
git reset --hard origin/$BRANCH
git pull origin $BRANCH
drush --uri=ddms-emag3.nurunci.com cc all
