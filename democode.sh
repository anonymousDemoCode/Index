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
		git config user.name anonymousDemoCode
		git config  user.email "anonymousDemoCode@users.noreply.github.com"
		echo -e "-->> In $(pwd)\n"
		git pull
		git st
		git config --unset user.name
		git config  --unset user.email
		cd -
		echo -e "\nOut $(pwd) -->>"
        echo -e "\n\n\n"
    else
        git clone https://github.com/anonymousDemoCode/"${var##*/}".git
		cd "${var##*/}"
		git config user.name anonymousDemoCode
		git config  user.email "anonymousDemoCode@users.noreply.github.com"
		cd -
    fi
done
