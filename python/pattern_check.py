#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 16 May 2016
# Version 1
# Simple Powershell script to check for patterns in password file
#=========================================================================================


import sys
import crypt
# Read file into lines
f = open(sys.argv[1],"r+")
lines = f.readlines()
f.close()
found = []
for line in lines:
    data = line.split(':')
    # Set username and password to first 2 fields
    user,password = data[0:2]
    geco = data[4].split(',')
    # Create password guess using first char of first name and last field
    guess = geco[0][0] + geco[-1]
    #Assign salt as first 2 characters of crypted password
    salt = password[0:2]
# Check crypted value to see if matches, if yes put in found
if crypt.crypt(guess,salt) == password:
    userInfo = { "user" : user, "pass" : guess, "home" : data[5], "uid" : data[2] , "name" : geco[0] } 
    found.append(userInfo)
for user in found:
    print "User  %s " % user['user']
    for k in user.keys():
        print k
        #if k == "user":
            #continue
        print("\t%s : %s" % (k,user[k]))


