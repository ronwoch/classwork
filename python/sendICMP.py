#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2017
# Version 1
# Simple Powershell script to send ICMP packets
#=========================================================================================

import sys
from scapy.all import *
conf.ver = 0
f = open(sys.argv[1])
data = f.read()
f.close()

host = sys.argv[2]
print("Data size is %d " % len(data))
i = 0
while i < len(data):
    pack = IP(dst=host)/ICMP(type="echo-reply")/data[i:i+32]
    send(pack)
    i=i+32

