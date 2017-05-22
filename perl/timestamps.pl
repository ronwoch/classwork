#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# 20 May 2017
# Version 1
# Simple Perl script to Modify timestamps on files
#=========================================================================================

$file = "testfile";
`touch $file`;

print "original timestamps\n";
($origaccessed, $origmodified) = get_timestamps($file);
sleep(5);
`touch $file`;
print "modified timestamps \n";
get_timestamps($file);
utime $origaccessed, $origmodified, $file;
print "final timestamps\n";
get_timestamps($file);

sub get_timestamps
{
$timestampfile = @_[0];
@timestamps[0] = (stat($timestampfile))[8];
@timestamps[1] = (stat($timestampfile))[9];
print "accessed = ", scalar localtime(@timestamps[0]),"\n";
print "modified = ", scalar localtime(@timestamps[1]),"\n";
return @timestamps;
}
