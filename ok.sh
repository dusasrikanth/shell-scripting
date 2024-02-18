#!/bin/bash
# File to store information about processes exceeding 60% CPU usage
output_file="process_monitor.log"
# File to store information about processes exceeding 60% CPU usage
output_file="process_monitor.log"
# Email address to receive notifications
email_address="sreekanthsri208@gmail.com"
while true; do
# Get the list of processes sorted by memory usage in descending order
processes=$(ps -aux --sort=-%mem | awk '{if ($4 > 1.0) print}')
