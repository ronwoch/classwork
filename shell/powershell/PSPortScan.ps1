#!/usr/bin/powershell
#=========================================================================================
# Ronald Wochner 
# 12 May 2017
# Version 1
# Simple Powershell script to scan ports with PowerShell
#=========================================================================================

# Using an array, we can get the arguments in order
($device, $port, $start, $stop ) = $args

# function pingdevice
# ping the device to see if it is on the network

function pingdevice {
    if (test-connection $device -erroractions silentlycontinue) {
        write-output "$device is up"
    }else{
        write-output "$device is down"
        exit
    }
}

# function checkports
# check to see if our ports are open

function checkports {
    if ($port -match "multi") { #This branch checks a port range
        for ($counter = $start; $counter -le $stop; $counter++) {
            write-output "testing port $counter on $device"
            $porttest = new-object Net.Sockets.TcpClient
            try {
                $connect = $porttest.connect($device, $counter)
                write-output "$counter is open"
            } catch {
                write-output "$counter is closed"
            }
        }
    } else { #This branch checks a single port
        write-output "testing port $port on $device"
        $porttest = new-object Net.sockets.TcpClient
        try {
            $connect = $porttest.connect($device, $port)
            write-output "$port is open"
        } catch {
            write-output "$port is closed"
        }
    }
}

# run our functions
pingdevice
checkports
        
