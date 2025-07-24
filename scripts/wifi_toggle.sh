#!/usr/bin/env bash

# get current state for wifi with `nmcli` ==> Network Manager
current_state=$(nmcli radio wifi)

# conditions to turn on / off WiFi
if [ "$current_state" = "enabled" ]; then
  # turn off the WiFi
  nmcli radio wifi off

  # send a little notification
  notify-send "WiFi Off 󰤮"

else
  # turn off the WiFi
  nmcli radio wifi on

  # send a little notification
  notify-send "WiFi On 󰤨"
fi
