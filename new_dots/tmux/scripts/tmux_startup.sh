#!/usr/bin/env bash

# check if tmux is actually installed on the system
tmux_installed() {
  if ! command -v tmux &>/dev/null; then
    printf "\n== TMUX is not installed ==\n"
    exit 1
  fi
}

# check if we already inside a tmux session
inside_tmux() {
  if [[ -n "$TMUX" ]]; then
    printf "\n== Already inside a TMUX session ==\n"
    exit 1
  fi
}

# populate tmux with windows and panes
tmux_populate() {
  local session_name="$1"
  local directory="$2"

  # create required windows inside the correct session
  tmux new-window -d -t "$session_name" -c "$directory"
  tmux new-window -d -t "$session_name" -c "$directory"
  tmux new-window -d -t "$session_name" -c "$directory"

  # setup panes for last window ==> window 4
  tmux split-window -h -t "${session_name}:4.1" -c "$directory"
  tmux select-layout -t "${session_name}:4" even-horizontal
  tmux split-window -v -t "${session_name}:4.2" -c "$directory"

  # send specific command to specific windows and panes
  tmux send-keys -t "${session_name}:1.1" "nvim" C-m
  tmux send-keys -t "${session_name}:3.1" "qwen" C-m
}

# custom startup tmux function
tmux_startup() {
  local session_name="tmux"
  local directory="."

  # parse arguments
  if [[ "$#" -eq 0 ]]; then
    session_name="tmux"
    directory="."

  elif [[ "$#" -eq 1 ]]; then
    if [[ -d "$1" ]]; then
      directory="$1"
      session_name="tmux"
    else
      session_name="$1"
      directory="."
    fi

  elif [[ "$#" -eq 2 ]]; then
    session_name="$1"
    directory="$2"

  else
    printf "\n== Error: Too many arguments ==\n"
    printf "Usage: t [session_name] [directory]\n"
    exit 1
  fi

  # directory validation
  if [[ ! -d "$directory" ]]; then
    printf "\n== Error: Directory '%s' does not exist ==\n" "$directory"
    exit 1
  fi

  if [[ ! -r "$directory" || ! -x "$directory" ]]; then
    printf "\n== Error: No permission to access '%s' ==\n" "$directory"
    exit 1
  fi

  # check if session already exists
  if tmux has-session -t "$session_name" 2>/dev/null; then
    printf "\n== Session '%s' already exists! ==\n" "$session_name"
    exit 1
  fi

  # create session and populate
  tmux new-session -d -s "$session_name" -c "$directory"
  tmux_populate "$session_name" "$directory"
  tmux attach -t "$session_name"
}

# main execution
tmux_installed
inside_tmux
tmux_startup "$@"
