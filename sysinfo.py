#!/usr/bin/env python
#A System Information Gathering Script
#Global character Support
# -*- coding: utf-8 -*-
import subprocess
#Today date
subprocess.call("date", shell=True)
#List of functions
def uname_func():
	uname = "uname"
	u_arg = "-a"
	print "Gathering system information with %s command:\n" % uname
	subprocess.call([uname,u_arg])
	print "----------------------------------------------"

def disk_func():
	diskspace = "df"
	diskspace_arg = "-h"
	print "Gathering system information with %s command:\n" % diskspace
	subprocess.call([diskspace, diskspace_arg])
	print "----------------------------------------------"

def host_ip():
	host = "hostname"
	ip   = "-l"
	print "Gathering system information with %s command:\n" % host
	subprocess.call([host, ip])
	print "----------------------------------------------"

def main():
	uname_func()
	disk_func()
	host_ip()
if __name__ == "__main__":
 main()
