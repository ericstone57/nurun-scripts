#!/bin/bash

# Script to export minimum data
# Exclude data: user and related, statistics, cache, log, migrate
# By Eric.Lee

#set -x

DB_NAME='ddms'
DB_USER='ddms'
DB_PWD='ddms'
DB_HOST='192.168.10.85'
TABEL_PREFIX='martell_'
FILE=db-latest.sql

rm -rf $FILE

SKIP_TABLES=( migrate user stats tracker weibo watchdog cache session )

OPTS=$(printf "\|%s" "${SKIP_TABLES[@]}")
OPTS="${OPTS:2}"

# ignore some tables for data dump
TABLES=`mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep -v $OPTS`
mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME $TABLES > $FILE

# dump tables structures only for those special ones
TABLES=`mysql -u$DB_USER -p$DB_PWD -h$DB_HOST -e 'show tables' -s --skip-column-names $DB_NAME | grep $OPTS`
mysqldump --no-data -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME $TABLES >> $FILE

# demo user and user role
mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME ${TABEL_PREFIX}users_roles >> $FILE
mysqldump -u$DB_USER -p$DB_PWD -h$DB_HOST $DB_NAME ${TABEL_PREFIX}users --where="uid = 0 or name='admin'" >> $FILE

bzip2 -z9 $FILE
