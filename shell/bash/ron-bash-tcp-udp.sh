#!/bin/bash
#=========================================================================================
# Ronald Wochner echo 
# 11 May 2017
# Version 1.1
# Simple shell script to Scan TCP and UDP ports
#=========================================================================================

#populate our variable from the arguments
starthost=$1
stophost=$2
startport=$3
stopport=$4
protocol=$5

# function pingcheck
# ping a device to see if it is up

pingcheck()
{
    for ((counter=$starthost; counter<=$stophost; counter++))
        do
            $host=counter
            echo "pinging $host..."
            ping=`ping -c 1 $host | grep bytes | wc -l`
            if [ "$ping" -gt 1 ]; then 
                echo "$host is up";
                tcpcheck
                udpcheck
            else
                echo "$host is down.";
            fi
        done
}

# function tcpcheck
# test a tcp port to see if it is open

tcpcheck()
{
    echo "Testing TCP ports $startport thru $stopport...."
    for ((counter=$startport; counter<=$stopport; counter++))
        do
            (echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open"
        done
}

# function udpcheck
# test a udp port to see if it is open
udpcheck()
{
    echo "Testing UDP ports $startport thru $stopport...."
    for ((counter=$startport; counter<=$stopport; counter++))
        do
            (echo >/dev/udp/$host/$counter) > /dev/null 2>&1 && echo "$counter open"
        done
}

# run our functions

pingcheck

exit
