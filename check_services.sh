#!/bin/bash

status_nginx=$(systemctl status nginx |grep Active |awk '{ print $2 }')
status_app=$(systemctl status flask-auth-example |grep Active |awk '{ print $2 }')
log_file="/var/log/flask-auth/log_status_services"


if [ "$status_nginx" = "active" ]; then
    echo "web server is running" >> $log_file
elif [ "$status_nginx" = "inactive" ];then
    echo "web server is stopped" >> $log_file
else
    echo "web server status is failed" >> $log_file
fi

if [ "$status_app" = "active" ]; then
    echo "flask-auth-example is running" >> $log_file
elif [ "$status_app" = "inactive" ];then
    echo "flask-auth-example is stopped" >> $log_file
else
    echo "flask-auth-example status is failed" >> $log_file
fi
