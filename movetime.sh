#!/bin/bash

# alarm="$HOME/.alarm.wav"
time="$1"
start="$SECONDS"
s=1

function main(){
	echo -ne "\007"
	while [ $s -gt 0 ]
	do
		s="$((time - ($SECONDS - $start)))"
		sleep 0
	done
	echo -ne "\007"
	exit 0 
}

main