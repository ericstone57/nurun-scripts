#!/bin/bash

set -x

USER="webown"
HOST="192.168.10.21"
PROJECT_PATH="/home/webown/sites/ddms/sites/default"
FILE=ddms-file-latest.tar.gz

ssh $USER@$HOST "(cd $PROJECT_PATH && \
  tar \
  --exclude=js \
  --exclude=css \
  --exclude=less \
  --exclude=ctools \
  --exclude=styles \
  --exclude=ugc_article \
  --exclude=article/cover/file* \
  --exclude=useravatar/file* \
  -czvf - files)" \
  > $FILE

