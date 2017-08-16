#!/usr/bin/env python
#A System Information Gathering Script
import subprocess
#Today date
subprocess.call("date", shell=True)
def uname_func():
	uname = "uname"
	u_arg = "-a"
	print "Gathering system information with %s command:\n" % uname
	subprocess.call([uname,u_arg])

def disk_func():
	diskspace = "df"
	diskspace_arg = "-h"
	print "Gathering system information with %s command:\n" % diskspace
	subprocess.call([diskspace, diskspace_arg])

def main():
	uname_func()
	disk_func()
main()