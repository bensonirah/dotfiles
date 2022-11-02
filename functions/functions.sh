#!/bin/bash

function lowercase() {
 echo $1 | tr '[[:upper:]]' '[[:lower:]]'
}

function checkws() {
	local website=$1
	local http_status=`curl -sLI $website | grep HTTP | tail -n 1 | cut -d$' ' -f2`
	local log_date=$(date +"%Y/%m/%d %T")
	echo "[${log_date}] ${http_status} ${website}"
}

function search() {
	if test -n "$2";then
		find $1 -type f -iname $2
	elif test ! -t 0; then
		cat > /tmp/input.txt
		find $1 -type f -iname $(cat /tmp/input.txt)
		rm /tmp/input.txt
	else
		echo "Unable to run search command"
	fi
}


function trim() {
 echo "$1" | xargs
}
function psearch() {
	find $1 -type d -name '.git' | sed "s/.git//" | grep $2
}

function levelbatt() {
 echo  `upower -d | grep percentage |head -n 1 |awk -F':' '{print $2}' | xargs`
}


function s(){
	source ~/.zshrc
}