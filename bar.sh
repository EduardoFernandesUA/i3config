#!/bin/bash

while true; do
  # Get current time
  current_time=$(date +"%T")

  # Get battery information using upower and extract percentage and time to empty
  bat0=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
  percentage=$(echo "$bat0" | grep -E "percentage" | awk '{print $2}')
  time_to_empty=$(echo "$bat0" | grep -E "time to empty" | awk '{print $4 $5}')

  # Display the information
  echo "$current_time | 🔋$percentage $time_to_empty |"

  sleep 1
done
