#!/bin/bash

MYSQL_USER="admin"
MYSQL_PASSWORD="Cookies2@@3erit5ut..@!!"
MYSQL_DATABASE="aurin_schools_sandbox"

BACKUP_DIR="/var/backups/mysql/mysql_backups"


DATE=$(date +"%Y%m%d%H%M")


BACKUP_FILE="$BACKUP_DIR/$MYSQL_DATABASE-$DATE.sql"


KEEP_DAYS=7


mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_FILE


if [ $? -eq 0 ]; then
    echo "MySQL backup successful: $BACKUP_FILE"
    
    gzip $BACKUP_FILE
else
    echo "Error in MySQL backup"
fi


find $BACKUP_DIR -type f -mtime +$KEEP_DAYS -name '*.sql*' -exec rm {} \;
