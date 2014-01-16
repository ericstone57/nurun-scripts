#!/bin/bash

# Script to export minimum data
# Exclude data: user and related, statistics, cache, log, migrate
# By Eric.Lee
#set -x

USER='root'
HOST='192.168.10.21'
DB_NAME='ddms'
DB_USER='ddms'
DB_PWD='ddms'
DB_HOST='192.168.10.85'
TABEL_PREFIX='martell_'
FILE=ddms-db-latest.sql.gz
SSH_CMD="ssh $USER@$HOST"

rm -rf $FILE

SKIP_TABLES=( migrate user stats tracker weibo watchdog cache session )

OPTS=$(printf "\|%s" "${SKIP_TABLES[@]}")
OPTS="${OPTS:2}"

# ignore some tables for data dump
$SSH_CMD "mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep -v $OPTS | xargs mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME | gzip" > $FILE

# dump tables structures only for those special ones
$SSH_CMD "mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep $OPTS | xargs mysqldump --no-data -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME | gzip" >> $FILE

# demo user and user role
$SSH_CMD "mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME ${TABEL_PREFIX}users_roles | gzip" >> $FILE
$SSH_CMD "mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME ${TABEL_PREFIX}users --where=\"uid = 0 or name='admin'\" | gzip" >> $FILE

