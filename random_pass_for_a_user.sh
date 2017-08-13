#!/bin/bash
###Creating Random password for a User and send through email####
# Author	:	Blackboy (Babin Lonston)
# Date		:	06/01/2017
# Version	:	v0.01
# Usage		:	schedule cronjob to run the script
pass=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo)
echo "$pass" | passwd "sysadmin" --stdin
echo $pass | mail -s "password of sysadmin" user@oel7.com
exit;
