#!/usr/bin/php
#=========================================================================================
# get.php
# Ronald Wochner 
# Wed May 31 09:43:20 PDT 2017
# Version 1
# Simple php script to explore conditionals in php
#=========================================================================================

<PRE>
<?php

if(function_exists('php_uname'))
{
    print "Server Uname is: ";
    print php_uname() ;
    print "\n";
}

foreach (array_keys($_ENV) as $i) {
    print "\$_ENV[$i] = {$_ENV[$i]}\n";
}

$keys = array_keys($_SERVER);
for ($i = 0; $i < count($keys); $i++)
{
    if ($keys[$i] == '_' || $keys[$i] == 'ORACLE_HOME')
    {
        continue;
    }
    print "\$_SERVER[($keys[$i]}] = {$_SERVER[$keys[$i]]}\n";
}

$i = 0;
$keys = array_keys($_GET);
while($i < count($keys))
{
print "\$_GET[{$keys[$i]}] = {$_GET[$keys[$i]]}\n";
$i++;
}
?>
</PRE>

