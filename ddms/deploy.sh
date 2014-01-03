#!/bin/bash
set -x
PROJECT=~/sites/ddms
BRANCH=production

cd $PROJECT
git reset --hard origin/$BRANCH
git pull origin $BRANCH
cp ~/ddms/settings.php sites/default/
rm -rf sites/default/modules/ddms_performance/speedy/js
drush smj uglifyjs
drush cc all
