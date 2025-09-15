#!/bin/bash

LOG_FILE="/var/log/flask-auth/status_services.log"
TIMESTAMP=$(date '%Y-%m-%d %H:%M:%S')

STATUS_NGINX=$(systemctl is-active nginx 2>/dev/null )
STATUS_APP=$(systemctl is-active flask-auth-example 2>/dev/null )

if [ "$STATUS_NGINX" = "active" ]; then
    echo "[$TIMESTAMP] web server is running" >> $LOG_FILE
elif [ "$STATUS_NGINX" = "inactive" ];then
    echo "[$TIMESTAMP] web server is stopped" >> $LOG_FILE
else
    echo "[$TIMESTAMP] web server status is failed" >> $LOG_FILE
fi

if [ "$STATUS_APP" = "active" ]; then
    echo "[$TIMESTAMP] flask-auth-example is running" >> $LOG_FILE
elif [ "$STATUS_APP" = "inactive" ];then
    echo "[$TIMESTAMP] flask-auth-example is stopped" >> $LOG_FILE
else
    echo "[$TIMESTAMP] flask-auth-example status is failed" >> $LOG_FILE
