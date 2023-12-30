#!/bin/bash
# getting free_disk_space in percentage  

free_disk_space=$(df -H | egrep -v "Filesystem|tmpfs" | grep "sda3" | awk '{print $5}' | tr -d % )

# to alert in email (1st set up postfix )

#TO=<provide your email after setting up postfix>

#set your threshold value
threshold=50

if [ $free_disk_space -gt $threshold ]
then
  echo "warning"
  echo "diskspace is running out of memory : available space is $free_disk_space %" 
# mail -s "disk space alert !" $TO
else
  echo "all good"
fi

