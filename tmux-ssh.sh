#!/bin/sh

tmux new-window -n $1
tmux send-keys -t:$1 "ssh $1" C-m
