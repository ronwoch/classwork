#!/usr/bin/php
#=========================================================================================
# formtest.php
# Ronald Wochner 
# Sat Jun  3 20:04:50 PDT 2017
# Version 1
# Simple php script to playing with forms in php
#=========================================================================================

<?php
if($_REQUEST['submit'])
{
print "<PRE>\nGET:\n";
print_r($_GET);
print "\n\nPOST:\n";
print_r($_POST);
print "\n\nFILES:\n";
print_r($_FILES);
print "\n\n</PRE\n";
}
?>
<DIV ALIGN=CENTER>
<FORM METHOD=POST ACTION="formtest.php?get1=test&get2=alsotest"
ENCTYPE="multipart/form-data">
<TABLE BORDER=1>
<TR><TH COLSPAN=2> Test Form </TH></TR>
<TR><TD>Text</TD><TD><INPUT NAME="text" TYPE=TEXT></TD></TR>
<TR><TD>Checkbox</TD><TD><INPUT NAME="check" TYPE=CHECKBOX CHECKED>
</TD></TR>
<TR><TD>Radio Yes</TD><TD><INPUT NAME="radio" TYPE=RADIO VALUE="yes">
</TD></TR>
<TR><TD>Radio No</TD><TD><INPUT NAME="radio" TYPE=RADIO VALUE="no">
</TD></TR>
<TR><TD>File</TD><TD><INPUT NAME="file" TYPE=FILE></TD></TR>
<TR><TH COLSPAN=2><INPUT TYPE=SUBMIT NAME="submit" VALUE="SUBMIT!">
</TH></TR>
</TABLE>
</FORM>
</DIV>

