#!/bin/bash

# Remote server details
REMOTE_USER=vagrant
REMOTE_HOST=192.168.56.114
REMOTE_DIR=/backup/

# Source directory
SOURCE_DIR=/home/vagrant

# Rsync command for secure backup
rsync -avz -e ssh $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR >> /tmp/backup.log 2>&1

# Error checking
if [ $? -eq 0 ]; then
    echo "Backup successful"
else
    echo "Backup failed"
    exit 1
fi
