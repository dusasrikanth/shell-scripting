#!/bin/bash

echo "executed" >> /home/srikanth/testfile
echo "This cron tab running at every minute > $(date +"%d-%m-%Y %H:%M")" | mailx -s "Mail From CronTab" sreekanthsri208@gmail.com
