#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# Mon May 22 10:51:40 PDT 2017
# Version 1
# Simple Perl script to improved MAC script
#=========================================================================================

# fetch the OUI database from IEEE

`wget -N http://standards.ieee.org/develop/regauth/oui/oui.txt 2>/dev/null`;

open (LOG, ">>maclog.log") || die "Cannot open maclog.log for append $!\n";

$netinfo =`ifconfig | grep ether`;
print "network information is ",$netinfo,"\n";
print LOG "network information is ",$netinfo,"\n";
$netinfo =~ m/(([0-9a-f]{2}[:-]){5}[0-9a-f]{2})/i;

$mac = $&; # $& is the previous successful match
print "the MAC address is ",$mac,"\n";
print LOG "the MAC address is ",$mac,"\n";
@macparts = split /:/, $mac;

@ouiparts = splice(@macparts,0,3);
$oui = join('',@ouiparts);

print "the oui is ",$oui,"\n";
print LOG "the OUI is ",$oui,"\n";

open (OUIDB,"oui.txt") || die "Cannot open oui.txt $!\n";
while (<OUIDB>){
    $line = $_; # $_ is the implicit scalar variable
    print "line is ", $line,"oui is ",$oui,"\n";
    if ($line =~ /$oui/i) {
        @ouientry = $line;
        last;
    } else {
        @ouientry[0] = "manufacturer not found";
    }
}
close (OUIDB) || die "Cannot close oui.txt $1\n";

@ouientryfields = split(/\t/ ,@ouientry[0]);

print "the manufacturer is ",@ouientryfields[2],"\n";
print LOG "the manufacturer is ", @ouientryfields[2],"\n";
print LOG "*******************************************\n";

close (LOG) || die "Cannot close maclog.log $1\n";

