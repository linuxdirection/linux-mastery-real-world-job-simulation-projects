#!/bin/bash

# Slack webhook URL
SLACK_WEBHOOK_URL=''

# The threshold for disk usage (90%)
THRESHOLD=5

# Get the current disk usage %
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# Server Hostname
SERVER_HOSTNAME=$(hostname)

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
  MESSAGE=":exclamation: ALERT - Disk usage on $SERVER_HOSTNAME is at $DISK_USAGE%."
  # Sending the alert message to Slack
  curl -X POST -H 'Content-type: application/json' --data "{'text':'$MESSAGE'}" "$SLACK_WEBHOOK_URL"
fi
