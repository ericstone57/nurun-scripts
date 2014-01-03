#!/bin/bash
set -x
set -e

PROD_SRV1=192.168.10.21
#PROD_SRV2=192.168.10.200

cd ~/sites/ddms-emag3

for srv in $PROD_SRV1
do
	rsync -arvP --delete \
		--exclude=.git \
		--exclude=sites/sites.php \
		--exclude=sites/magazine/settings.php \
	       	--exclude=sites/magazine/files \
	       	--exclude=sites/default \
	       	--exclude=var \
	       	. $srv:~/sites/emag3/
done

ssh $PROD_SRV1 "cd ~/sites/emag3; drush --uri=emag.dangdaimingshi.com cc all"
