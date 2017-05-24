#!/usr/bin/ruby
#=========================================================================================
# Ronald Wochner 
# Wed May 24 11:48:13 PDT 2017
# Version 1
# Simple ruby script to fetch headers from a website
#=========================================================================================

require 'net/http'

def getHeader(host,port = nil)
    port = port || 80
    Net::HTTP.start(host.to_s,port) do |http|
    resp = http.head('/')
    return [resp['server'].to_s,resp['Last-Modified'].to_s]
end
return[nil,nil]
end

if ARGV.size <= 0 || ARGV.size > 2
    print "Usage: #{0} Host [Port]\n"
    exit
end
server, modified = getHeader(ARGV[0],ARGV[1])
print "Server #{ARGV[0]}:#ARGV[1] || 80} (#{server}) last modified #{modified}\n"

