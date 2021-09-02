#!/bin/bash

session_name=ceph

tmux new-session -d -s $session_name


## Kubernetes Master Nodes

ceph_nodes()
{
#  layout=$( tmux display-message -p "#{window_layout}" )
  layout=b07d,164x41,0,0[164x28,0,0,122,164x12,0,29{81x12,0,29,123,82x12,82,29,124}]
  tmux new-window -t $session_name
  tmux rename-window "ceph nodes"
  tmux split-window -h
  tmux split-window -h
  tmux select-layout $layout
    tmux select-pane -t 0
    tmux send "ssh destek@172.16.0.100" C-m  # cnode1
    tmux select-pane -t 1
    tmux send "ssh destek@172.16.0.101" C-m  # cnode2
    tmux select-pane -t 2
    tmux send "ssh destek@172.16.0.103" C-m  # cnode3
  tmux select-pane -t 0
}
ceph_nodes

tmux attach -t $session_name
