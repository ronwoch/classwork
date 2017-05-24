#!/usr/bin/ruby
#=========================================================================================
# Ronald Wochner 
# Wed May 24 11:34:12 PDT 2017
# Version 1
# Simple ruby script to explore control statements
#=========================================================================================

data = `last`.split("\n")
users = []
hosts = []
data.each do |l|
    if l == ""
        next
    elsif l.start_with? "reboot"
        next
    elsif l.start_with? "wtmp"
        next
    else
        l.rstrip!
        users << l[0,8].rstrip
        hosts << l[17,16].rstrip.lstrip
    end
end

users.uniq!
hosts.uniq!

until users.empty?
    print "User: %s\n" % users.pop
end

while not hosts.empty?
    print "Host: %s\n" % hosts.pop
end


