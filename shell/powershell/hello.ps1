#!/usr/bin/powershell
#=========================================================================================
# Ronald Wochner 
# 12 May 2017
# Version 1
# Simple Powershell script to say hello to you
#=========================================================================================

function hello {
$LOCAL:name = "whoever you are"
write-output "hello there "$name
}

$name = $args[0]
Write-output "hello there "$name
hello
write-output "hello there " $name
