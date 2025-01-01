#!/bin/sh

#Allow execution only when sudo is provided.
if [[  $UID -ne 0  ]]; then
    echo "Sudo permission is required."
    exit 1
fi

#Allow execution with single argument.
if [[  $# -ne 1  ]]; then
    echo "Service name should be passed as input."
    echo "USAGE: ./script.sh <service_name>"
    exit 1
fi

systemctl status $1 1>/dev/null 2>&1

statusValue=$?

if [[  statusValue -eq 0  ]]; then
    echo "Service is running.."
    exit 0
elif [[  statusValue -eq 3  ]]; then
    echo "Service is not running.."
    exit 0
else
    echo "Service not found.."
    exit 1
fi
