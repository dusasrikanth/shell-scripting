#!/bin/bash

#####################
#
# Author: Srikanth
# Date:   08-07-2023
# Version: 1
# Description: This script is used to create users on the server
#
#####################


#Script should be executed with root access.
if [[ "${UID}" -ne 0 ]]
then
	echo "Please run the script with sudo/root"
	exit 1
fi

#Check whether two arguments are supplied.
if [[ "${#}" -lt 2 ]]
then
	echo "Usage: sh ${0} USER_NAME"
	exit 1
fi

#Set required variables
USER_NAME=${1} #Username of the user to be created.

shift
COMMENTS=${@}  #Comments while creating the user.

PASSWORD=$(date +%s%N) #Generate random password.

#Create user
useradd $USER_NAME -m -s /bin/bash -c "${COMMENTS}"

if [[  $? -ne 0  ]]
then
	echo "User could not be created.."
	exit 1
fi

#Set password for the user.
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ $? -ne 0 ]]
then
	echo "Password could not be set."
	exit 1
fi

#Expire the password
passwd -e ${USER_NAME}

#Restrict others to access this user's dir.
chmod 700 /home/"${USER_NAME}"

echo
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "hostname: $(hostname)"
echo
echo "User created successfully."

exit 0
