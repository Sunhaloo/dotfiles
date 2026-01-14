#!/usr/bin/env bash

user_session_name="$1"

# start the tmux server
tmux start-server

# create a new session with argument
tmux new-session -d -s "$user_session_name" -n "main"

# create windows required without switching to it
tmux new-window -d -t "$user_session_name" -n "secondary"
tmux new-window -d -t "$user_session_name" -n "agent"

# create window and switch to it
tmux new-window -d -t "$user_session_name" -n "server"

# create new required panes in the 'server' window without switching
tmux split-window -h -t "$user_session_name:server.1"

tmux select-layout -t "$user_session_name:server" even-horizontal

tmux split-window -v -t "$user_session_name:server.2"

# run commands
tmux send-keys -t "$user_session_name":main.1 "nvim" C-m
tmux send-keys -t "$user_session_name":agent.1 "qwen" C-m

# return to main
tmux select-window -t main

# actually attach to the new session created
tmux attach -t "$user_session_name"
