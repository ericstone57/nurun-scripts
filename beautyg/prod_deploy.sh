#!/bin/bash
set -x
set -e

PROD_SRV1=192.168.10.54
PROD_SRV2=192.168.10.56

cd ~/sites/beautyg

for srv in $PROD_SRV1 $PROD_SRV2
do
	rsync -arvP --delete \
		--exclude=.git \
		--exclude=tmp \
		--exclude=sites/default/settings.php \
	       	--exclude=sites/default/files \
	       	--exclude=sites/default/themes/beautyg_skin/.sass-cache \
	       	. $srv:~/sites/beautyg/
done

ssh $PROD_SRV1 "cd ~/sites/beautyg; drush cc all"
