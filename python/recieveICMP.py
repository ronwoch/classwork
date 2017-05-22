#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2017
# Version 1
# Simple Powershell script to recieve ICMP packets
#=========================================================================================

import sys
from scapy.all import *
conf.verb = 0
f = open(sys.argv[1],"w")
host = sys.argv[2]
count = int(sys.argv[3])

filter = "icmp and host " + host
print("sniffing with filter (%s) for %d bytes" % (filter,int(count)))
packets = sniff(count, filter=filter)
for p in packets:
    f.write(p['Raw'].load)

f.close()
print("Data Recieved")


