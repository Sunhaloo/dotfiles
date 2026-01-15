#!/usr/bin/env bash

# tmux windows and panes population function
tmux_windows_panes_populate() {
  local sn="$1" # Session Name

  # Create windows (using the -t flag to ensure they go to the right session)
  tmux new-window -d -t "$sn" -c "$directory"
  tmux new-window -d -t "$sn" -c "$directory"
  tmux new-window -d -t "$sn" -c "$directory"

  # Panes setup for Window 4
  # Note: We use ${sn}:4 to be precise
  tmux split-window -h -t "${sn}:4.1" -c "$directory"
  tmux select-layout -t "${sn}:4" -c "$directory" even-horizontal
  tmux split-window -v -t "${sn}:4.2" -c "$directory"

  # Send commands to specific panes
  tmux send-keys -t "${sn}:1.1" "nvim" C-m
  tmux send-keys -t "${sn}:3.1" "qwen" C-m
}

# custom startup tmux function ( with windows and panes population )
tmux_startup_procedure() {
  local session_name="tmux"
  local directory="."

  if [[ "$#" -eq 0 ]]; then
    echo "Start TMUX with default session name"
    session_name="default"

  elif [[ $# -eq 1 ]]; then
    if [[ -d "$1" ]]; then
      directory="$1"
      session_name="tmux"
    else
      session_name="$1"
    fi

  elif [[ "$#" -eq 2 ]]; then
    echo "Start TMUX with user session name and in another directory"
    session_name="$1"
    directory="$2"
  fi

  echo "$session_name"
  echo "$directory"

  tmux new-session -d -s "$session_name" -c "$directory"
  tmux_windows_panes_populate "$session_name"
  tmux attach -t "$session_name"
}

# array that is going to hold the arguments passed
arguments=("$@")

# condition on how to start TMUX session
if [[ "${#arguments[@]}" -eq 0 ]]; then
  tmux_startup_procedure
elif [[ "${#arguments[@]}" -eq 1 ]]; then
  tmux_startup_procedure "$1"
elif [[ "${#arguments[@]}" -eq 2 ]]; then
  tmux_startup_procedure "$1" "$2"
fi
