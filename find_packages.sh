#!/bin/bash
echo "Verifying the nc command installation.."

command -v $1 && { echo "$1 is installed."; } || echo "${1} not found."
