#!/bin/bash

os_info=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f2 | tr -d '"')

case ${os_info} in
    centos)
        echo "This centos"
        ;;
    ubuntu)
        echo "This Ubuntu"
        ;;
    rhel)
        echo "This Redhat"
        ;;
    *)
        echo "This is Something else.."
        ;;
esac