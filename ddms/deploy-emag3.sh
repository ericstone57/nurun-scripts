#!/bin/bash
set -x
PROJECT=~/sites/ddms-emag3
BRANCH=emag-issue3.2

cd $PROJECT
git reset --hard origin/$BRANCH
git pull origin $BRANCH
cp ~/nurun-scripts/ddms/prod_config/settings-emag3.php sites/magazine/
drush --uri=ddms-emag3.nurunci.com cc all
