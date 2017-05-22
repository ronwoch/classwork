#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 17 May 2017
# Version 1
# Simple Powershell script to get the robots.txt of a web site
#=========================================================================================

import robotparser

sites = [ 'www.google.com','www.offensive-security.com','www.yahoo.com' ]

def getDenies(site):
    paths = []
    # Create a new robot parser instance and read the site's robots file
    robot = robotparser.RobotFileParser()
    robot.set_url("https://" + site + "/robots.txt")
    robot.read()

# For each entry, look at the rule lines and add the path to paths if disallowed

    for entry in robot.entries:
        for line in entry.rulelines:
            not line.allowance and paths.append(line.path)
    return set(paths)


for site in sites:
    print("Denies for " + site)
    print "\t" + "\n\t".join(getDenies(site))
