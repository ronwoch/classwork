#!/usr/bin/php
#=========================================================================================
# download.php
# Ronald Wochner 
# Sat Jun  3 20:30:10 PDT 2017
# Version 1
# Simple php script to download files
#=========================================================================================

<?php
if($_GET['file'])
{
    $file = $_GET['file'];
    if(file_exists($file) && is_file($file))
        {
        $basename = basename($file);
        header("Content-disposition: attachment; filename=$basename");
        readfile($file);
        }
}
?>


