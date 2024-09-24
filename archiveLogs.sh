# Write a shell script to find old logs and archive it

#!/bin/bash

# Directory containing log files
LOG_DIR="/path/to/logs"

# Number of days to consider a log file "old"
DAYS_OLD=30

# Archive name with current date
ARCHIVE_NAME="archived_logs_$(date +'%Y-%m-%d').tar.gz"

# Destination for the archive file
ARCHIVE_DEST="/path/to/archive"

# Find log files older than $DAYS_OLD days and archive them
echo "Searching for log files older than $DAYS_OLD days in $LOG_DIR..."

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory $LOG_DIR does not exist!"
    exit 1
fi

# Find and archive old log files
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD | tar -czf "$ARCHIVE_DEST/$ARCHIVE_NAME" -T -

# Check if archiving was successful
if [ $? -eq 0 ]; then
    echo "Successfully archived logs to $ARCHIVE_DEST/$ARCHIVE_NAME."
else
    echo "Error: Failed to archive log files."
    exit 1
fi

# Optionally, delete the old logs after archiving them (uncomment to enable)
# find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -delete

echo "Process completed."





Output:

Searching for log files older than 30 days in /path/to/logs...
Successfully archived logs to /path/to/archive/archived_logs_2024-09-24.tar.gz.
Process completed.
