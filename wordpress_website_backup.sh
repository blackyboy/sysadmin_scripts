#!/usr/bin/env bash
#
# SCRIPT: Backup Wordpress site with MySQL and Uploads
# AUTHOR: BABIN LONSTON
# DATE: 18/11/2018
# REV: 0.1.P
# PLATFORM: Linux
# COPYRIGHT: GPL v 3.0
#
# PURPOSE: Backup Wordpress Website with MySQL and Uploads.
#
# REV LIST:0.1.P
# DATE: 18/11/2018
# BY: BABIN LONSTON
# MODIFICATION: N/A
#
# set -n # Uncomment to check your syntax, without execution.
# set -x # Uncomment to debug
# HOW TO RUN: 0 0 * * * /bin/bash /var/www/mysite.com/backup.sh
#######################DEFINE VARIABLES###################################
DATFORM=$(date +%Y%m%d)
SITE_NAME=mysite.com
WEBROOT=/var/www
BACKUP_DIR="$WEBROOT/$SITE_NAME/backups"
WEBSITE_MYSITE="$WEBROOT/$SITE_NAME/public"
NOF_BCKS=10
if [[ -d "$BACKUP_DIR" ]]; then
        find "$BACKUP_DIR" -maxdepth 1 -type f \( -iname \*.sql -o -iname \*.tar.gz \) | wc -l
        if [[ $? -gt "$NOF_BCKS" ]]; then
        	find "$BACKUP_DIR/*" -type f \( -iname \*.sql -o -iname \*.tar.gz \) -mtime +10 | xargs rm -rf
        fi
fi
# Backup database
/usr/bin/mysqldump database_name_here > "$BACKUP_DIR"/mysite_com_"$DATFORM".sql --add-drop-table
# Backup uploads directory
/bin/tar zcf "$BACKUP_DIR"/mysite.com__uploads_"$DATFORM".tar.gz "$WEBSITE_MYSITE"/wp-content/uploads
exit 0