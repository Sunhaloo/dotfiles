#!/usr/bin/env bash

# WARNING: need to sleep the script to allow everything to load up!
notify-send "GitHub Pull Script Starting..."
sleep 5

# paths "constants"
REPO_DIR="$HOME/GitHub"
OBSIDIAN_REPO_DIR="obsidian"
UNI_REPO_DIR="University"

# general wrapper - error checking function
run_command() {
  local description="$1"
  shift

  printf "\n%s\n" "$description"

  if "$@"; then
    return 0
  else
    local exit_code=$?
    printf "Error: %s failed (exit code: %s)\n" "$description" "$exit_code" >&2
    return $exit_code
  fi
}

# helper function to check if directory exits
check_dir_existance() {
  local directory="$1"

  # check if the directory exists
  if [[ -d "$REPO_DIR/$directory" ]]; then
    return 0
  else
    local exit_code="$?"
    printf "Error: Could not find ( local ) repository directory '$directory' ( '$exit_code' )\n" >&2
    return "$exit_code"
  fi
}

# helper function to check pull the latest changes
pull_latest_changes() {
  local local_repository="$1"

  # change to correct repo directory
  cd "$REPO_DIR/$OBSIDIAN_REPO_DIR"

  # pull the latest changes from remote server and redirecty any errors to 'stdout'
  run_command "Pulling latest changes into '$local_repository'" git pull 2>&1
}

# helper function that will send to notification daemon
send_notification() {
  local output="$1"
  local repo_name="$2"

  # send the notification using ( in my case 'dunst' )
  notify-send -t 3500 "$repo_name" \ "$output"
}

# == OBSIDIAN GitHub Respository ==
obsidian_output=$(pull_latest_changes "$OBSIDIAN_REPO_DIR")
send_notification "$obsidian_output" "$OBSIDIAN_REPO_DIR"

# allow the user to actually read the notification
sleep 1

# == UNIVERSITY GitHub Respository ==
university_output=$(pull_latest_changes "$UNI_REPO_DIR")
send_notification "$university_output" "$UNI_REPO_DIR"
