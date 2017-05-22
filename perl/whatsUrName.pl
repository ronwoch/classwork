#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# 20 May 2017
# Version 1
# Simple Perl script to take names and chew gum
#=========================================================================================

print"Hi. What is your name?\n";
$name= <STDIN>; # take in a name
chomp $name;
print "$name is a nice name\n";
