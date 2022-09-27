#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 20/09/2022
# Last Modified: 27/09/2022

# Description
# Uses the sed command to imitate the functionality of the head command. The -n parameter of head is also implemented.

# Usage
# 9_sed_head.sh [-n (nr. of lines to show)] <filename>

count=10 #default.

while getopts "n:" opt; do
	case "$opt" in
	n) count=$OPTARG ;;
	*) echo "invalid argument" ;;
	esac
done
shift "$(($OPTIND-1))"

if [ ! -e "$1" ]; then
	echo "file has to exist."
	exit 1
fi


sed "${count}q" "${1}"

exit 0