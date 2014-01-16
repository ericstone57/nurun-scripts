#!/bin/bash
set -x

PROD=192.168.10.21
PROD_USER=webown
PROD_PATH=/home/webown/sites/ddms/sites/default/files
LOCAL_PATH=/home/webown/sites/ddms/sites/default/

rsync -arv \
      --exclude=js \
      --exclude=css \
      --exclude=less \
      --exclude=ctools \
      --exclude=styles \
      --exclude=ugc_article \
      --exclude=article/cover/file* \
      --exclude=useravatar/file* \
      $PROD_USER@$PROD:$PROD_PATH $LOCAL_PATH

