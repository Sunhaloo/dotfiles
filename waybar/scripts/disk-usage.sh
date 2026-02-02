#!/usr/bin/env bash

# get disk usage percentage as an integer
percentage=$(df --output=pcent / | tail -1 | tr -d '% ')

# define text, tooltip and class based on percentage
text="${percentage}%"
tooltip="Disk usage: ${percentage}% used"

# set class based on usage thresholds
if [ "$percentage" -ge 90 ]; then
	class="critical"
elif [ "$percentage" -ge 75 ]; then
	class="warning"
else
	class="normal"
fi

# output JSON that Waybar can parse
echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"class\": \"$class\", \"percentage\": $percentage }"
