#!/bin/bash

# This script performs a data backup

# Check if the script was run with the required parameters
if [ $# -ne 2 ]; then
  echo "Usage: $0 source_directory backup_directory"
  exit 1
fi

# The source directory to sync
source_dir="$1"

# The backup directory
backup_dir="$2"

# The log file
log_file="backup.log"

# The date and time of the backup
timestamp=$(date +"%Y-%m-%d %T")

# The rsync command
rsync_command="rsync -avh --delete --log-file=$log_file $source_dir $backup_dir"

# Perform the backup
$rsync_command

# Check if any files were added or deleted
new_files=$(grep "^>f" $log_file)
deleted_files=$(grep "^<f" $log_file)

# Add an entry to the log file for each added or deleted file
if [ -n "$new_files" ]; then
  echo "$timestamp: Added files:" >> $log_file
  echo "$new_files" >> $log_file
fi

if [ -n "$deleted_files" ]; then
  echo "$timestamp: Deleted files:" >> $log_file
  echo "$deleted_files" >> $log_file
fi

# Add the script to crontab to run every minute
crontab -l > mycron
echo "* * * * * $0 $source_dir $backup_dir" >> mycron
crontab mycron
rm mycron
