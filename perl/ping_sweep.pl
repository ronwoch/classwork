#!/usr/bin/perl
#=========================================================================================
# Ronald Wochner 
# Mon May 22 12:57:59 EDT 2017
# Version 1
# Simple Perl script to perform a ping sweep
#=========================================================================================

use Net::Ping;

$ip1 = @ARGV[0];
$ip2 = @ARGV[1];
$rawip1 = get_raw_address($ip1);
$rawip2 = get_raw_address($ip2);

for ($counter = $rawip1;$counter<=$rawip2;$counter++){
    $host = get_ip_address($counter);
    $pinger = Net::Ping->new("icmp", 1, 64);
    if ($pinger->ping($host)) {
        print "$host is up\n";
    } else {
        print "$host is down\n";
    }
}

###### get_raw_address ######
#get the raw version of an IP

sub get_raw_address {
    my $ipaddress;
    my $oct1;
    my $oct2;
    my $oct3;
    my $oct4;
    my $retval;

    $ipaddress = shift;
    ($oct1, $oct2, $oct3, $oct4) = split /\./, $ipaddress;
    $retval = $oct4 + ($oct3 * 2**8) + ($oct2 * 2**16) + ($oct1 * 2**24);
    return $retval;
}

###### get_ip_address ########
#get the regular version of an IP

sub get_ip_address {
    my $rawaddress;
    my $retval;
    my $oct;
    my $counter;

    $rawaddress = shift;
    while ($counter<4){
        $oct = $rawaddress % 2**8; #get the rightmost 8 bits
        $retval = $oct . "." . $retval;
        $rawaddress = int($rawaddress / 2**8); #get the next 8 bits
        $counter++;
    }
    chop $retval;
    if ($retval =~ m/\.(255 |0)$/) { # skip 0 & 255 addresses
        return 0;
    }
    print "retval = ", $retval, "\n";
    return $retval;
}
