#!/bin/bash

#Defining variables
BACKUP_SRC="/tmp"
BACKUP_DST="/backups"
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILENAME="backup_$BACKUP_DATE.tar.gz"

mkdir -p "$BACKUP_DST/$BACKUP_DATE"

# archive the source directory
tar -czf "$BACKUP_DST/$BACKUP_DATE/$BACKUP_FILENAME" "$BACKUP_SRC"

#verify the backup is created successfully or not

if [ $? -eq 0 ]
then 
  echo "Backup is created successfully : $BACKUP_FILENAME "
else 
  echo "Backup failed"
fi
