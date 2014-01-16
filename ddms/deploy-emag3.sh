#!/bin/bash
set -x
PROJECT=~/sites/ddms-emag3
BRANCH=emag-issue3.2

cd $PROJECT
git fetch
git reset --hard origin/$BRANCH
git pull origin $BRANCH
cp ~/nurun-scripts/ddms/prod_config/settings-emag3.php sites/magazine/settings.php
cp ~/nurun-scripts/ddms/prod_config/sites-emag3.php sites/sites.php
drush --uri=ddms-emag3.nurunci.com cc all
