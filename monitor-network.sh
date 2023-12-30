#!/bin/bash

# Define the list of hosts to monitor
hosts=("example.com" "google.com" "localhost")

# Define the log file path
log_file="/path/to/network_monitor.log"

# Define the email settings
recipient="your@email.com"
subject="Network Monitor Alert"

# Function to send email alert
send_email_alert() {
    echo "Subject: $subject" | cat - "$log_file" | sendmail -t "$recipient"
}

# Function to ping hosts and log the results
monitor_network() {
    date_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "--------------------- $date_time ---------------------" >> "$log_file"

    for host in "${hosts[@]}"; do
        ping_result=$(ping -c 3 "$host" 2>&1)
        if [[ $? -ne 0 ]]; then
            echo "Host $host is unreachable. Sending email alert."
            echo "Host $host is unreachable: $date_time" >> "$log_file"
            send_email_alert
        else
            echo "Host $host is reachable."
            echo "Host $host is reachable: $date_time" >> "$log_file"
        fi
    done
}

# Execute the network monitoring function
monitor_network
