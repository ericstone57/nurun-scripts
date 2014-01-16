#!/bin/bash
# By Eric.Lee
#set -x

USER='webown'
HOST='192.168.10.21'
DB_NAME='ddms_emag'
DB_USER='ddms'
DB_PWD='ddms'
DB_HOST='192.168.10.85'
FILE=emag-db-latest.sql.gz

rm -rf $FILE
ssh $USER@$HOST "mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME | gzip" > $FILE
