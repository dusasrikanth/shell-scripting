#!/bin/bash

#gitURL=$(curl -s https://mirrors.edge.kernel.org/pub/software/scm/git/ | egrep -o '\-[0-9]+\.[0-9]+\.[0-9]+\.tar.gz' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+' | sort --version-sort --field-separator=.| uniq | tail -1)
# gitVersion=$(egrep -o '\-[0-9]+\.[0-9]+\.[0-9]+\.tar.gz' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+' | sort --version-sort --field-separator=.| uniq | tail -1)

# test=$(curl -s -w '%{http_code}' https://mirrors.edge.kernel.org/pub/software/scm/git/)
# echo $test

gitVerSourceUrl=https://mirrors.edge.kernel.org/pub/software/scm/git/
downFile=gitVersionInfo_$(date '+%F%T')
echo "Downloading versions html page......"
httpCode=$(curl -s -w '%{http_code}' ${gitVerSourceUrl} -o ${downFile})

echo "Successfully downloaded versions info"
latestVer=$(grep -oE '\-[0-9]+\.[0-9]+\.[0-9]+\.tar.gz' ${downFile} | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | sort --version-sort --field-separator=. | uniq | tail -1)
echo "The latest git version is: ${latestVer}"

