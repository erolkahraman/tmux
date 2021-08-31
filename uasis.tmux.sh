#!/bin/bash

session_name=uasis

tmux new-session -d -s $session_name


## Kubernetes Master Nodes

kub_masters()
{
#  layout=$( tmux display-message -p "#{window_layout}" )
  layout=b07d,164x41,0,0[164x28,0,0,122,164x12,0,29{81x12,0,29,123,82x12,82,29,124}]
  tmux new-window -t $session_name
  tmux rename-window "k8s masters"
  tmux split-window -h
  tmux split-window -h
  tmux select-layout $layout
    tmux select-pane -t 0
    tmux send "ssh erol.kahraman@192.168.100.111" C-m  # kubemaster-01.uasis.org
    tmux select-pane -t 1
    tmux send "ssh erol.kahraman@192.168.100.112" C-m  # kubemaster-02.uasis.org
    tmux select-pane -t 2
    tmux send "ssh erol.kahraman@192.168.100.113" C-m  # kubemaster-03.uasis.org
  tmux select-pane -t 0
}

kub_nodes()
{
#  layout=$( tmux display-message -p "#{window_layout}" )
  layout=b07d,164x41,0,0[164x28,0,0,122,164x12,0,29{81x12,0,29,123,82x12,82,29,124}]
  tmux new-window -t $session_name
  tmux rename-window "k8s workers"
  tmux split-window -h
  tmux split-window -h
  tmux select-layout $layout
    tmux select-pane -t 0
    tmux send "ssh erol.kahraman@192.168.100.114" C-m  # kubenode-01.uasis.org
    tmux select-pane -t 1
    tmux send "ssh erol.kahraman@192.168.100.115" C-m  # kubenode-02.uasis.org
    tmux select-pane -t 2
    tmux send "ssh erol.kahraman@192.168.100.116" C-m  # kubenode-01.uasis.org
  tmux select-pane -t 0
}

kub_t4_nodes()
{
  tmux new-window -t $session_name
  tmux rename-window "k8s-t4-gnodes"
  tmux split-window -h
  tmux select-layout tiled 
    tmux select-pane -t 0
    tmux send "ssh erol.kahraman@192.168.100.74" C-m  # gnode-t4-02.uasis.org
    tmux select-pane -t 1
    tmux send "ssh erol.kahraman@192.168.100.75" C-m  # gnode-t4-03.uasis.org
  tmux select-pane -t 0
}

kub_rtx_nodes()
{
  tmux new-window -t $session_name
  tmux rename-window "k8s-rtx-gnodes"
  tmux split-window -h
  tmux select-layout tiled 
    tmux select-pane -t 0
    tmux send "ssh erol.kahraman@192.168.100.76" C-m  # gnode-rtx-02.uasis.org
    tmux select-pane -t 1
    tmux send "ssh erol.kahraman@192.168.100.77" C-m  # gnode-rtx-03.uasis.org
  tmux select-pane -t 0
}


kub_nodes
kub_masters
kub_t4_nodes
kub_rtx_nodes


tmux attach -t $session_name
