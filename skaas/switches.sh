#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
session_name=switches

tmux new-session -d -s $session_name


## YAS Switches

yas_sws()
{
#  layout=$( tmux display-message -p "#{window_layout}" )
  tmux new-window -t $session_name
  tmux rename-window "YAS"
  tmux split-window -h
    tmux select-pane -t 0
    tmux send "sshpass -p $passwd ssh erol.kahraman@yas-sw1.skaas.net" C-m # 172.16.10.6 172.16.98.4
    tmux select-pane -t 1
    tmux send "sshpass -p $passwd ssh erol.kahraman@yas-sw2.skaas.net" C-m # 172.16.10.7 172.16.98.5
  tmux select-pane -t 0
  tmux setw synchronize-panes on
}

## KÇS-MNG Switches

kcs_mng_sws()
{
  tmux new-window -t $session_name
  tmux rename-window "KCS-MNG"
  tmux split-window -h
    tmux select-pane -t 0
    tmux send "telnet -l admin kcs-mng-m.skaas.net" C-m # 172.16.2.120 172.16.10.8
    tmux select-pane -t 1
    tmux send "telnet -l admin kcs-mng-b.skaas.net" C-m # 172.16.2.121 172.16.10.9
  tmux select-pane -t 0
  tmux setw synchronize-panes on
}

## KÇS-OUT Switches

kcs_out_sws()
{
  tmux new-window -t $session_name
  tmux rename-window "KCS-OUT"
  tmux split-window -h
    tmux select-pane -t 0
    tmux send "telnet -l admin kcs-out-m.skaas.net" C-m # 172.16.2.120 172.16.10.12
    tmux select-pane -t 1
    tmux send "telnet -l admin kcs-out-b.skaas.net" C-m # 172.16.2.121 172.16.10.13
  tmux select-pane -t 0
  tmux setw synchronize-panes on
}
## KÇS-INP Switches

kcs_inp_sws()
{
  tmux new-window -t $session_name
  tmux rename-window "KCS-INP"
  tmux split-window -h
    tmux select-pane -t 0
    tmux send "telnet -l admin 172.16.98.166" C-m # 172.16.98.166 172.16.10.11 172.16.2.241
    tmux select-pane -t 1
    tmux send "telnet -l admin 172.16.98.165" C-m # 172.16.98.165 172.16.10.10 172.16.2.240
  tmux select-pane -t 0
  tmux setw synchronize-panes on
}

user=$(whiptail --inputbox "Kullanıcı Adı" 8 40 kullanıcı adı --title "Kullanıcı Adı" 3>&1 1>&2 2>&3)
passwd=$(whiptail --passwordbox "$USER kullanıcısının şifresi" 8 40 --title "Şifre" 3>&1 1>&2 2>&3)

#read -p "RADIUS (LDAP) Kullanıcı Adı > " user
#echo -n -e "${RED}$user${NC} Şifresi > "
#read -s passwd


yas_sws
kcs_mng_sws
kcs_out_sws
kcs_inp_sws

tmux attach -t $session_name
