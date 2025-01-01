#!/bin/bash

declare -A pkg

pkg=([networktool]=httpd [mailtool]=postfix)

for i in ${pkg[@]}
do
    echo $i
done

# for (( ; ;))
# do
#     echo ""
# done

