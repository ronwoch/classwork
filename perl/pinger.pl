#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# Sat May 20 16:17:57 EDT 2017
# Version 1
# Simple Perl script to ping a host
#=========================================================================================

use Net::Ping;

$host = "10.0.0.1";

$pinger = Net::Ping->new("icmp", 1, 64);
if ($pinger->ping($host)) {
    print "$host is up\n";
} else {
    print "$host is down\n";
}
