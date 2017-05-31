#!/usr/bin/php
#=========================================================================================
# variables.php
# Ronald Wochner 
# Wed May 31 09:13:04 PDT 2017
# Version 1
# Simple php script to play with php variables.
#=========================================================================================

<?php
$i = 5;
$f = 5.5;
$b = true;
$a = array(1,2,3,4,5);
$h = array('a' => 'b','c' => 'd');
print "My values are: $i, $f, $b, {a[0]}, {$h['a']}\n";
print_r($a);
print_r($h);
?>

