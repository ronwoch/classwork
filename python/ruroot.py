#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2016
# Version 1
# Simple Powershell script to check for root access
#=========================================================================================

import os
myuid = os.getuid()
if myuid == 0:
    print("You are root")
elif myuid < 500:
    print("You are a system account")
else: 
    print("You are just a regular user")
