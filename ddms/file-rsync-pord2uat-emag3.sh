#!/bin/bash
set -x

PROD=192.168.10.21
PROD_USER=webown
PROD_PATH=/home/webown/sites/emag3/sites/magazine/files
LOCAL_PATH=/home/webown/sites/ddms-emag3/sites/magazine/

rsync -arv \
      --delete \
      --exclude=styles \
      --exclude=js \
      --exclude=css \
      --exclude=less \
      $PROD_USER@$PROD:$PROD_PATH $LOCAL_PATH
