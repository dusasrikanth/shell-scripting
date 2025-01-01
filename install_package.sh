#!/bin/bash

function install_package() {
    
    pkg=${1}

    if command -v ${pkg} 1>/dev/null 2>&1 ; then
        echo "$(date "+%F %T"): ${pkg} is already deployed"
    else
        echo "Installing ${pkg}.."
        yum install ${pkg} -y
    fi
}

install_package nc
install_package httpd
