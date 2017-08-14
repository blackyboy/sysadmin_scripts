#!/usr/bin/env python
#A System Information Gathering Script
import subprocess
#Today's date and time
subprocess.call("date", shell=True)
print "\n"
#Check Kernel version
un = "uname"
un_arg = "-a"
print "Gathering system information with %s command:\n" % un
subprocess.call([un, un_arg])
print "\n"
#check for current disk space
dsk = "df"
dsk_arg = "-h"
print "Gathering diskspace information %s command:\n" % dsk
subprocess.call([dsk, dsk_arg])
print "\n"
subprocess.call("hostname", shell=True)
