#!/bin/bash
set -x
PROJECT=~/sites/ddms
BRANCH=production

cd $PROJECT
git fetch
git reset --hard origin/$BRANCH
git pull origin $BRANCH
cp ~/nurun-scripts/ddms/prod_config/settings-ddms.php sites/default/settings.php
rm -rf sites/default/modules/ddms_performance/speedy/js
drush smj uglifyjs
drush cc all
