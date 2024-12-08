#!/bin/bash

# Define variables
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
LOG_FILE="myapp.log"
MAX_SIZE=10000000  # Maximum size of the log file in bytes (10 MB)

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Check if the log file exists and its size
if [ -f "$LOG_DIR/$LOG_FILE" ] && [ $(stat -c%s "$LOG_DIR/$LOG_FILE") -ge $MAX_SIZE ]; then
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    ARCHIVE_FILE="$ARCHIVE_DIR/$LOG_FILE.$TIMESTAMP.gz"
    
    # Rotate and compress the log file
    mv "$LOG_DIR/$LOG_FILE" "$LOG_DIR/$LOG_FILE.$TIMESTAMP"
    gzip "$LOG_DIR/$LOG_FILE.$TIMESTAMP"
    
    # Create a new empty log file
    touch "$LOG_DIR/$LOG_FILE"
fi

