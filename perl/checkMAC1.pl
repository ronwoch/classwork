#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# Mon May 22 10:27:11 PDT 2017
# Version 1
# Simple Perl script to play with regex and MAC adresses
#=========================================================================================

$text = `sudo ifconfig | grep ether`;
print "the string is ",$text,"\n";
$text =~ m/((?:[0-9a-f]{2}[:-]){5}[0-9a-f]{2})/i;
print "the mac is ",$&,"\n"; # $& is the previous successful match
