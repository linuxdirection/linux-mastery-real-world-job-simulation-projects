#!/bin/bash

# Define the log file path, threshold, and the Slack webhook URL
LOGFILE="/var/log/secure" # Change as needed
THRESHOLD=5
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX" # Replace with your Webhook URL
HOSTNAME=$(hostname)

# Function to send a message to Slack
send_to_slack() {
    local message=$1
    curl -X POST --data-urlencode "payload={\"text\": \"$message\"}" $SLACK_WEBHOOK_URL
}

# Check for suspicious SSH login activities
echo "Checking for suspicious SSH login activities..."
sudo awk '/Failed password for/ {for (i = 1; i <= NF; i++) if ($i == "from") {print $(i+1)} }' $LOGFILE | sort | uniq -c | sort -nr | while read count ip
do
    if [ $count -gt $THRESHOLD ]; then
        message="[$HOSTNAME] Suspicious Activity Detected: $count failed login attempts from IP $ip"
        echo $message
        send_to_slack "$message"
    fi
done
