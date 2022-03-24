#!/bin/bash
function in_array() {
 declare -A sessions
 tmux_sessions=( $(tmux ls | awk -F':' '{print $1}') )
 for ts in "${tmux_sessions[@]}";do
	sessions[$ts]=1
 done
 echo ${sessions[$1]}
 exit 0
}

function create_session() {
	# Session name
	local session_name=$1
	# chek if a session already exist
	local has_session=$(in_array $session_name)

	if [[ $has_session -eq 1 ]];then
		echo "Session: ${session_name} already exist"
		exit 1
	fi

	tmux new -d -s $session_name
	tmux send-keys -t $session_name:0 "tmux split-window -v -p 30" ENTER
	tmux send-keys -t $session_name:0 "clear" ENTER
	tmux send-keys -t $session_name:0 "vim" ENTER
	tmux a -t $session_name
	exit 0
}

if [[ $# -eq 0 ]]; then
	echo "session name required!"
	echo "usage: ide session"
	exit 1
fi


tmux ls 2>/dev/null

if [[ $? -ne 0 ]];then
	create_session $1
fi

create_session $1


