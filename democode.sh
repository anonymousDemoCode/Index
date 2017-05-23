#!/bin/bash
# this script used for auto sync the repositories of DemoCode on github

# path control
declare -r gWorkingDir="$(pwd)"
declare -r gSelfDir="$(cd "$(dirname "$0")"; pwd)"
cd "${gSelfDir}"

var=0
githubRepo=("Index" "C" "Shell_Bash" "Python" "CPP" "Makefile")

#if [ "5CG4380W65" = "$(hostname)" ]; then export https_proxy=http://10.144.1.10:8080; fi

for var in "${githubRepo[@]}"; do
    if [ -d "${var}" ];then
        cd "${var}"
		echo -e "-->> In $(pwd)\n"
		git pull
		git st
		git config user.name anonymousDemoCode
		cd -
		echo -e "\nOut $(pwd) -->>"
        echo -e "\n\n\n"
    else
        git clone https://github.com/anonymousDemoCode/"${var##*/}".git
		cd "${var##*/}"
		git config user.name anonymousDemoCode
		cd -
    fi
done
