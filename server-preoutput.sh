#!/bin/bash
#################################################################
## Author               :       Babin Lonston
## Created on           :       01/09/2016
## Modified on          :       08/09/2016
## Version              :       0.04
## Use of Script        :       Server Pre-Output
## Copyright            :       GPL v 3.0
#################################################################
# Check for current user to run the script.
#if [ "$(whoami)" != 'root' ];
# then
#  echo "You are $USER user, You have no permission to run $0 as non-root user."
# else
#  echo "You are $USER User!."
#exit 0
#fi
# Create files with Date and timestamp.
dat=$(date +"%d-%b-%y-%T")
sig=/tmp/signal-file.out
#Check for Signal file & Permission
if [ -f "$sig" ]; then
#Check Ownership of signal file.
   sigur=$(stat -c "%U" $sig)
   echo -e "Already script running from $sigur user. \n"
exit;
   else
touch $sig
fi
# Create Output and log files under /tmp.
touch /tmp/Pre-Output-file-$dat.txt
touch /tmp/Pre-Output-log-$dat.log
outp=/tmp/Pre-Output-file-$dat.txt
logf=/tmp/Pre-Output-log-$dat.log
echo -e "Files are touched under /tmp \n" >> $logf
# Store the command output under variables.
var1="$(lsb_release -a | grep Description | cut -f 2)"
var2="$(cat /etc/passwd | awk -F':' '{print $1 " " $7 " "}' | xargs -n4 printf "%-25s%s\n")"
echo "-------------------------------------------------------------" >> $outp
echo "This Script started to run at" `date` >> $outp
echo "-------------------------------------------------------------" >> $outp
echo "You are running this script from $PWD directory" >> $outp
echo "-------------------------------------------------------------" >> $outp
echo "You are running this script in $HOSTNAME server" >> $outp
echo "-------------------------------------------------------------" >> $outp
echo "Print the Operating System and version" >> $outp
echo "$var1" >> $outp
echo "-------------------------------------------------------------" >> $outp
echo "Find the user and there shell" >> $outp
echo "-------------------------------------------------------------" >> $outp
echo "Users                      Shell" >> $outp
echo "#####                     ######" >> $outp
echo "$var2" >> $outp
echo "-------------------------------------------------------------" >> $outp
echo -e "Outputs are saved under Pre-Output-file. \n" >> $logf
#Removing Signal file
rm -rf $sig
echo -e "signal file removed. \n" >> $logf
exit
