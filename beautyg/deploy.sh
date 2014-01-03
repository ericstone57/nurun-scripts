#!/bin/bash
set -x

cd ~/sites/beautyg
git checkout -- sites/default/themes/beautyg_skin
git pull origin release/1.1
cp ~/beautyg/settings.php sites/default/
cd sites/default/themes/beautyg_skin
compass clean
compass compile -c prod_config.rb --force
cd ~/sites/beautyg
drush smj uglifyjs
drush cc all
