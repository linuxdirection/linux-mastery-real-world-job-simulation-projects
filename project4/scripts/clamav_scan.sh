#!/bin/bash

LOG_FILE="/var/log/clamav/clamscan_$(date '+%Y-%m-%d').log"

sudo clamscan /home/vagrant/ -l "$LOG_FILE"

LOG_CONTENT=$(sudo cat "$LOG_FILE")

HOSTANEM=$(hostname)

SLACK_WEBHOOK_URL=""

SLACK_MESSAGE="ClamAV Scan Results for $HOSTNAME:\n$LOG_CONTENT"

curl -X POST -H 'Content-type: application/json' --data "{"text":"${SLACK_MESSAGE}"}" $SLACK_WEBHOOK_URL
