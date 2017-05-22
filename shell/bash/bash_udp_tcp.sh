#!/bin/bash
#=========================================================================================
# Ronald Wochner echo 
# 11 May 2017
# Version 1
# Simple shell script to Scan TCP ports
#=========================================================================================

#populate our variable from the arguments
host=$1
startport=$2
stopport=$3

#function pingcheck
#ping a device to see if it is up

pingcheck()
{
ping=`ping -c 1 $host | grep bytes | wc -l`
if [ "$ping" -gt 1 ]; then 
echo "$host is up";
else
echo "$host is down. Quitting...";
exit
fi
}

#function tcpcheck
#test a TCP port to see if it is open

tcpcheck()
{
echo "Testing TCP ports"
for ((counter=$startport; counter<=$stopport; counter++))
do
(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "TCP $counter open"
done
}

#function udpcheck
#test UDP ports to see if they are open
udpcheck()
{
echo "Testing UDP ports"
for ((counter2=$startport; counter2<=$stopport; counter2++))
do
(echo >/dev/udp/$host/$counter2) > /dev/null 2>&1 && echo "UDP $counter2 open"
done
}

#run our functions
pingcheck
tcpcheck
udpcheck

exit
