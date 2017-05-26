#!/usr/bin/ruby
#=========================================================================================
# class.rb
# Ronald Wochner 
# Thu May 25 10:33:55 PDT 2017
# Version 1
# Simple ruby script to Create a fetch header class
#=========================================================================================

require 'net/http'

class MyHead
    def initialize(host,port = nil)
        @host = host
        @port = port.to_i || 80
    end

    def getHeader()

        Net::HTTP.start(@host.to_s,@port) do |http|
            resp = http.head('/')
            return [resp['server'].to_s, resp['Last-Modified'].to_s]
        end

        return [nil,nil]
    end
end

if ARGV.size <= 0 || ARGV.size > 2
    print "Usage: #{$0} Host [Port]\n"
    exit
end

head = MyHead.new(ARGV[0],ARGV[1])
server, modified = head.getHeader()
print "Server #{server} (#{modified})\n"
