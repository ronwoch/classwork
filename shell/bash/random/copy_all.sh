#!/bin/bash

#===========================================================
# Ronald Wochner
# 5/10/2017
# Version 1
# Simple shell script to copy files to my backup drive
#===========================================================

echo "Copying all files from /home/wochnerr/shell/ to /mnt/e/Scripting/shell"
cp -r /home/wochnerr/shell/ /mnt/e/Scripting/
echo "Copy complete."
