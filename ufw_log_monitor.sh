#!/bin/bash
# Usage: 
#   ./ufw_log_monitor.sh | tail -n 25 
#   watch -n 2 "./ufw_log_monitor.sh | tail -n 25 "

#ufw log file 
infile="/var/log/ufw.log"

#sort log file 
while read line; do
    case $line in
    *"DPT"*)
        ip="${line##*SRC=}"
        ip="[ Source IP: ${ip%% *} ]"
        port="${line##*DPT=}"
        port="[ Port: ${port%% *}"
        proto="${line##*PROTO=}"
        proto="${proto%% *} ]"
	    mac="${line##*MAC=}"
	    mac="${mac%% *}"
	    macAdd="[ Source MAC: $(echo $mac | cut -d ':' -f7,8,9,10,11,12) ]"
        echo "$macAdd - $ip - $port $proto"
        ;;
    *"DST"*)
        ip="${line##*SRC=}"
        ip="${ip%% *}"
        dst="${line##*DST=}"
        dst="${dst%% *}"
        proto="${line##*PROTO=}"
        proto="${proto%% *}"
    	mac="${line##*MAC=}"
	    mac="${mac%% *}"
	    macAdd="[Source MAC: $(echo $mac | cut -d ':' -f7,8,9,10,11,12)]"
        echo "mDNS:$ip -> $dst"
        ;;    
    esac
done < "$infile"
