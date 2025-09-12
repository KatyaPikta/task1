#!/bin/bash
LOG_FILE="/var/log/flask-auth/basic-metrics.log"

{
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') ==="
    echo "UPTIME:"
    uptime
    echo ""
    echo "DISK USAGE:"
    df -h
    echo ""
    echo "TOP PROCESSES:"
    top -b -n1 | head -n 20
    echo "====================================="
} >> "$LOG_FILE"
