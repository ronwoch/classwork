#!/usr/bin/php
#=========================================================================================
# base64.php
# Ronald Wochner 
# Wed May 31 08:42:49 PDT 2017
# Version 1
# Simple php script to convert base64 encoded text
#=========================================================================================

<?php
    if($_REQUEST['b64'])
    {
        print "Base64 value for " . htmlspecialchars($_REQUEST['b64']) . " is <BR>\n<PRE>";
        print htmlspecialchars(base64_decode($_REQUEST['b64']));
        print "\n</PRE>\n<BR>";
    }

?>
</BR>

<FORM METHOD=POST>
    <TEXTAREA NAME='b64' COLS=80 ROWS=5>
    </TEXTAREA>
    <BR>
    <INPUT TYPE=SUBMIT VALUE="Submit!">
</FORM>

