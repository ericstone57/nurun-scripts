#!/bin/bash
# By Eric.Lee
#set -x

REMOTE_USER='webown'
REMOTE_HOST='192.168.10.21'
REMOTE_DB_NAME='ddms_emag'
REMOTE_DB_USER='ddms'
REMOTE_DB_PWD='ddms'
REMOTE_DB_HOST='192.168.10.85'
LOCAL_DB_NAME='emag3'
LOCAL_DB_USER='ddms'
LOCAL_DB_PWD='ddms'
LOCAL_DB_HOST='192.168.10.132'

ssh $REMOTE_USER@$REMOTE_HOST "mysqldump -u$REMOTE_DB_USER -p$REMOTE_DB_PWD -h$REMOTE_DB_HOST $REMOTE_DB_NAME" \
  | mysql -u$LOCAL_DB_USER -p$LOCAL_DB_PWD -h$LOCAL_DB_HOST $LOCAL_DB_NAME
