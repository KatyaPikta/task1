#!/bin/bash


BACKUP_DIR="/var/backups/database"
DATABASE_FILE="/var/www/flask-auth-example/instance/database.db"
LOG_FILE="/var/log/flask-auth/backup_db.log"
RETENTION_DAYS=7


mkdir -p "$BACKUP_DIR"


TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="$BACKUP_DIR/database_backup_${TIMESTAMP}.db"

cp "$DATABASE_FILE" "$BACKUP_FILE"


find "$BACKUP_DIR" -name "database_backup_*.db" -mtime +$RETENTION_DAYS -delete

echo "[$TIMESTAMP] Backup is done: $BACKUP_FILE" >> $LOG_FILE
