#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 20/09/2022
# Last Modified: 27/09/2022

# Description
# Uses the sed command to imitate the functionality of the tail command. Counts the nr of lines using wc (which is rather hacky) and then uses sed on the correct range of lines. The -n parameter of tail is also implemented.

# Usage
# 10_sed_tail.sh [-n (nr. of lines to show)] <filename>

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

linecount=$(wc -l "${1}")
linecount=$(echo $linecount | cut -d" " -f 1)

if [ $count -gt $linecount ]; then
	count=$linecount
fi

start=$((${linecount}-${count}+1))

sed -nr "${start},${linecount} p" "${1}"

exit 0