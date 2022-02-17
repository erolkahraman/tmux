#!/bin/bash

session_name=gnodes

tmux new-session -d -s $session_name


kub_t4_nodes()
{
  tmux new-window -t $session_name
  tmux rename-window "k8s-t4-gnodes"
  tmux split-window -h
  tmux select-layout tiled 
    tmux select-pane -t 0
    tmux send "ssh root@192.168.100.74" C-m  # gnode-t4-02.uasis.org
    tmux select-pane -t 1
    tmux send "ssh root@192.168.100.75" C-m  # gnode-t4-03.uasis.org
  tmux select-pane -t 0
}

kub_rtx_nodes()
{
  tmux new-window -t $session_name
  tmux rename-window "k8s-rtx-gnodes"
  tmux split-window -h
  tmux select-layout tiled 
    tmux select-pane -t 0
    tmux send "ssh root@192.168.100.76" C-m  # gnode-rtx-02.uasis.org
    tmux select-pane -t 1
    tmux send "ssh root@192.168.100.77" C-m  # gnode-rtx-03.uasis.org
  tmux select-pane -t 0
}


kub_t4_nodes
kub_rtx_nodes


tmux attach -t $session_name
