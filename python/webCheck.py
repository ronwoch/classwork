#!/usr/bin/python
#=========================================================================================
# Ronald Wochner 
# 16 May 2017
# Version 1.1
# Simple Powershell script to Test web service to make sure it's still alive
#=========================================================================================

import httplib, sys
from optparse import OptionParser
usageString = "Usage: %prog [options] hostname"
parser = OptionParser(usage = usageString)
parser.add_option("-p", "--port", dest="port", metavar="PORT", default=80, type="int", help="Port to connect to")
(opts,args) = parser.parse_args()
if len(args) < 1:
    parser.error("Hostname is required")
host = args[0]
port=opts.port
client = httplib.HTTPConnection(host,port)
client.request("GET", "/")
resp = client.getresponse()
client.close()
if resp.status != 200: 
    print host + " : DOWN! (" + resp.status + " , " + resp.reason + ")"
    sys.exit()
if resp.status == 200:
    print host + " : OK"
    sys.exit()
