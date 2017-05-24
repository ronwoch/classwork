#!/usr/bin/ruby
#=========================================================================================
# Ronald Wochner 
# Wed May 24 09:30:09 PDT 2017
# Version 1
# Simple ruby script to ARP scan
#=========================================================================================

require 'socket'

s = UDPSocket.new

254.times do |i|
    next if i == 0
    s.send("test", 0, "192.168.1." + i.to_s, 53)
end

f = File.open("/proc/net/arp", 'r')
data = f.read.split("\n")

up_hosts = []
data.each do |line|
    entry = line.split(/\s+/)
    next if entry [3] == "00:00:00:00:00:00"
    next if entry [0] == "IP"
    up_hosts << {:ip => entry[0], :mac => entry[3]}
end

print "Active network hosts\n"
print "%-12s\t%s\n" % ["IP Addr" , "MAC Address"]

up_hosts.each do |host|
    print "%-12s\t%s\n" % [host[:ip], host[:mac]]
end


