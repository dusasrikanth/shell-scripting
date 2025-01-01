#!/bin/bash

if ! [[ $# -eq 1  ]]; then
    echo "File need to be passed as a argument"
    exit 1
fi

if ! [[ -e $1  ]]; then
    echo "File doesn't exist"
    exit 1
fi

if [[ -r $1  ]]; then
    cat $1
else
    echo "File doesn't have read permissions"
    exit 1
fi