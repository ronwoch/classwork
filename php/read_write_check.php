#!/usr/bin/php
#=========================================================================================
# read_write_check.php
# Ronald Wochner 
# Sat Jun  3 20:40:36 PDT 2017
# Version 1
# Simple php script to read and write files
#=========================================================================================

<?php
if($_GET['read'])
{
    $file = $_GET['read'];
    if(file_exists($file) and is_file($file))
    {
        $f = fopen($file,"r");
        print "<PRE>File contents are:\n";
        $out = "";
        while($data = fread($f,1024))
        {
            $out .= $data;
        }
        fclose($f);
        print $out;
    }
}

if($_GET['write'] && $_GET['data'])
{
    $file = $_GET['write'];
    $data = $_GET['data'];
    $f = fopen($file,"a+");
    fwrite($f,$data . "\n");
    fclose($f);
    print "Write to $file: <BR><PRE>$data</PRE>";
}
?>
