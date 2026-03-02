#!/usr/bin/env bash

# WARNING: need to sleep the script to allow everything to load up ( WiFi, etc )!
notify-send "GitHub Pull Script Starting..."
sleep 2

# paths "constants"
REPO_DIR="$HOME/GitHub"

# add or remove repository directory names here
REPOS=(
  "obsidian"
  "University"
)

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

# helper function to check if directory exists
check_dir_existence() {
  local directory="$1"

  # check if the directory exists
  if [[ -d "$REPO_DIR/$directory" ]]; then
    return 0
  else
    printf "Error: Could not find ( local ) repository directory '$directory'\n"
    return 1
  fi
}

# helper function to pull the latest changes
pull_latest_changes() {
  local local_repository="$1"
  local dir_check
  local output
  local summary

  # check the directory exists before proceeding
  dir_check=$(check_dir_existence "$local_repository")

  if [[ $? -ne 0 ]]; then
    printf "%s" "$dir_check"
    return 1
  fi

  # change to correct repo directory
  cd "$REPO_DIR/$local_repository"

  # pull the latest changes from remote server and redirect any errors to 'stdout'
  output=$(git pull 2>&1)

  #
  if [[ "$output" == *"Already up to date"* ]]; then
    summary="Already up to date"
  else
    # INFO: get the latest commit message only if there are changes made
    summary=$(git log -1 --pretty=format:"<i>%s</i> — <b>%an</b>")
  fi

  printf "Pulling latest changes into <b>'%s'</b>\n\nOutput:\n%s" "$local_repository" "$summary"
}

# helper function that will send to notification daemon
send_notification() {
  local output="$1"
  local repo_name="$2"
  local urgency="${3:-normal}"

  # send the notification using ( in my case 'dunst' )
  notify-send -u "$urgency" -t 3500 "$repo_name" "$output"
}

# start pulling the latest changes for all the local repositories
for repo in "${REPOS[@]}"; do
  output=$(pull_latest_changes "$repo")

  # check if there are an errors
  if [[ $? -ne 0 ]]; then
    # create and add error message and repository name to an array
    errors+=("$repo|$output")
  else
    # send notifications if not errors has been found!
    send_notification "$output" "$repo"
  fi

  sleep 1
done

# NOTE: this is how the `errors` array looks like inside:
#
# errors=(
#  "repository|Error: Could not find ( local ) repository directory 'repository'"
# )
#
# hence, the reason of having `repo="${error%%|*}"` and `output="${error##*|}"`
# to get repository name and also error message

# INFO:
# the main reason for doing this is how dunst's urgent notifications works
# it pushes "urgent" notification at the top of the stack
# but given that I want to display the "success" first, we have to do this

for error in "${errors[@]}"; do
  # get the repository name and error message
  repo="${error%%|*}"
  output="${error##*|}"

  # send the "urgent" notification to dunst
  send_notification "$output" "$repo" "critical"
done
