#!/bin/bash

set -x

USER="webown"
HOST="192.168.10.21"
PROJECT_PATH="/home/webown/sites/emag3/sites/magazine"
FILE=emag-file-latest.tar.gz

ssh $USER@$HOST "(cd $PROJECT_PATH && \
  tar \
  --exclude=js \
  --exclude=css \
  --exclude=less \
  --exclude=ctools \
  --exclude=styles \
  -czvf - files)" \
  > $FILE

