#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2017
# Version 1
# Simple Powershell script to who knows what this is supposed to do - the name sure doesn't tell us :P
#=========================================================================================

import socket

# Build a socket and connect to google.com
af,type,proto,name,conn = socket.getaddrinfo("www.google.com", 80, 0, 0, socket.SOL_TCP)[0]
s = socket.socket(af,type,proto)
s.connect(conn)

# Send a basic http request
s.send("GET / HTTP/1.0\nHost: www.google.com\n\n")
page=""
# while data is still coming back, append to our page variable

while 1:
    data = s.recv(1024)
    if data == "":
        break
    page = page + data

# close our socket and print the results
s.close()
print page
