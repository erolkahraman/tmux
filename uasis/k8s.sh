#!/bin/bash
session_name=k8s
tmux new-session -d -s $session_name
layout=b07d,164x41,0,0[164x28,0,0,122,164x12,0,29{81x12,0,29,123,82x12,82,29,124}]

k8s_masters()
{
tmux new-window -t $session_name
tmux rename-window masters
tmux split-window -h
tmux split-window -h
tmux select-layout $layout
   tmux select-pane -t 0
   tmux send "ssh root@192.168.100.111" C-m  # kubemaster-01.uasis.org
   tmux select-pane -t 1
   tmux send "ssh root@192.168.100.112" C-m  # kubemaster-02.uasis.org
   tmux select-pane -t 2
   tmux send "ssh root@192.168.100.113" C-m  # kubemaster-03.uasis.org
}


k8s_workers()
{
tmux new-window -t $session_name
tmux rename-window workers
tmux split-window -h
tmux split-window -h
tmux select-layout $layout
   tmux select-pane -t 0
   tmux send "ssh root@192.168.100.114" C-m  # kubenode-01.uasis.org
   tmux select-pane -t 1
   tmux send "ssh root@192.168.100.115" C-m  # kubenode-02.uasis.org
   tmux select-pane -t 2
   tmux send "ssh root@192.168.100.116" C-m  # kubenode-01.uasis.org
  tmux select-pane -t 0
}

k8s_masters
k8s_workers

tmux attach -t $session_name
