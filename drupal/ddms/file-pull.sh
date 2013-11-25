#!/bin/bash
set -x

UAT=192.168.10.130
UAT_USER=webown
FILE_PATH=/home/webown/sites/ddms/sites/default
FILE=file-latest.tar

ssh $UAT_USER@$UAT "rm -rf $FILE && cd $FILE_PATH && tar --exclude=styles --exclude=css --exclude=js --exclude=less -cvf $FILE files && mv $FILE ~/"
scp $UAT_USER@$UAT:~/$FILE .
