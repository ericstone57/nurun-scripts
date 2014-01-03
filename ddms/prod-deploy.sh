#!/bin/bash
set -x
set -e

PROD_SRV1=192.168.10.21
PROD_SRV2=192.168.10.200

cd ~/sites/ddms

for srv in $PROD_SRV1 $PROD_SRV2
do
	rsync -arvP --delete \
		--exclude=.git \
		--exclude=tmp \
		--exclude=sites/default/settings.php \
	       	--exclude=sites/default/files \
	       	--exclude=sites/magazine \
	       	--exclude=sites/sites.php \
	       	--exclude=var \
	       	. $srv:~/sites/ddms/
done

ssh $PROD_SRV1 "cd ~/sites/ddms; drush cc all"
