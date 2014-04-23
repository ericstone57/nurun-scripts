#!/bin/bash

# By Eric.Lee

set -x

PROD_SRV=192.168.10.37

cd ~/sites/sha-lancome-efforless-chic

compass clean && compass compile -c config-prod.rb

rsync -arvP --delete \
  --exclude=web/upload/* \
  --exclude=*.json \
  --exclude=*.lock \
  --exclude=*.log \
  --exclude=.git \
  --exclude=*.rb \
  --exclude=.sass-cache \
  --exclude=manifests \
  --exclude=nurun-site-build \
  --exclude=sass \
  --exclude=*.md \
  --exclude=Vagrantfile \
  --exclude=src/config.php \
  --exclude=js/platform.js \
  . $PROD_SRV:~/sites/efc/
