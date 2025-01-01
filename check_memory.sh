#!/bin/bash
# File to store information about processes exceeding 60% CPU usage
output_file="process_monitor.log"
# Email address to receive notifications
email_address="sreekanthsri208@gmail.com"
while true; do
# Get the list of processes sorted by memory usage in descending order
processes=$(ps -aux --sort=-%mem | awk '{if ($4 > 1.0) print}')

# Check if there are any processes exceeding memory usage > 1.0
if [ -n "${processes}" ]; then
# Get the current date and time
current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

# Write information about the processes to the output file
echo "Processes exceeding memory usage > 1.0 at $current_datetime:" >> "$output_file"
echo "$processes" >> "$output_file"
echo "----------------------------------------" >> "$output_file"

# Send an email notification
# echo -e "Subject: High Memory Usage Alert\n\nProcesses exceeding memory usage > 1.0:\n\n$processes" | mail -s "High Memory Usage Alert" "$email_address"
fi

done
