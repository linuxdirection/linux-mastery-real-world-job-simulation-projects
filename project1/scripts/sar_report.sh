#!/bin/bash

REPORT_DIR="/var/log/sar_reports"

DATE=$(date '+%Y-%m-%d')

REPORT_FILE="$REPORT_DIR/cpu_mem_io_report_$DATE"

sudo mkdir -p $REPORT_DIR

sudo sh -c "sar -urbd > $REPORT_FILE"
