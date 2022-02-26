#!/bin/bash

declare -A services

while read line
do
	service="$( echo $line | awk '{print $1}' )"
	number="$( echo $line | awk '{print $2}' )"
	if [[ -v "services["${service}"]" ]]; 
	then
		services["$service"]=$(( "${services[$service]}" + $number ));
       	else 
		services["$service"]=$number;
	fi;
done < "${1:-/dev/stdin}"

for key in "${!services[@]}"; do echo $key "${services[$key]}" >> out; done
#echo "${services[@]}"
