#!/bin/bash

# Please run under script's directory but parent
# By Eric.Lee

#set -x

PROJECT=~/sites/ddms
BRANCH=production
LOCAL_PATH=`pwd`

cd $PROJECT
git fetch
git reset --hard origin/$BRANCH
git pull origin $BRANCH
# system setting
cp $LOCAL_PATH/prod_config/settings-ddms.php $PROJECT/sites/default/settings.php
# sass convert and compressor
cd $PROJECT/sites/default/themes/ddms && compass clean && compass compile -c config.prod.rb --force
cd $PROJECT
# js parser and compressor
rm -rf $PROJECT/sites/default/modules/ddms_performance/ddms_uglifyjs/js && drush smj uglifyjs
# clean cache
cd $PROJECT
drush cc all
