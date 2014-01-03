#!/bin/bash
set -x

PROD=192.168.10.21
PROD_USER=webown
FILE=db-latest.sql.bz2

#ssh $PROD_USER@$PROD "bash ~/db-dump.sh"
scp $PROD_USER@$PROD:~/$FILE .
