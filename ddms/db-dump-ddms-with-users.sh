#!/bin/bash

# Script to export minimum data
# Exclude data: user and related, statistics, cache, log, migrate
# By Eric.Lee
#set -x

USER='webown'
HOST='192.168.10.21'
DB_NAME='ddms'
DB_USER='ddms'
DB_PWD='ddms'
DB_HOST='192.168.10.85'
TABEL_PREFIX='martell_'
FILE=ddms-db-latest-with-users.sql
SSH_CMD="ssh $USER@$HOST"

rm -rf $FILE

SKIP_TABLES=( migrate watchdog cache session )

OPTS=$(printf "\|%s" "${SKIP_TABLES[@]}")
OPTS="${OPTS:2}"

# ignore some tables for data dump
$SSH_CMD "mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep -v $OPTS | xargs mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME" > $FILE

# dump tables structures only for those special ones
$SSH_CMD "mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep $OPTS | xargs mysqldump --no-data -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME" >> $FILE

# compass
bzip2 $FILE

