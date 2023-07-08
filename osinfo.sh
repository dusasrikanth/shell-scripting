#!/bin/bash

#########################
#
#Author: Srikanth
#
#Date : 01-07-2023
#
#
#This script displays the operating system details.

set -e #Ext if any errors.

echo
echo "Printing OS info.."
echo
cat /etc/os-release
echo
echo "OK"
