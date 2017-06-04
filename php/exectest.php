#!/usr/bin/php
#=========================================================================================
# exectest.php
# Ronald Wochner 
# Sat Jun  3 20:57:57 PDT 2017
# Version 1
# Simple php script to execute commands in php.
#=========================================================================================

<?php
print "<PRE>";
exec("ls -l",$out);
print_r($out);
print "--------------------------------\n";
$last = system("ls -l");
print "</PRE>";
?>

