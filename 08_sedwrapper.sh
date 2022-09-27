#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 20/09/2022
# Last Modified: 27/09/2022

# Description
# Wrapper for sed that replaces a word with the given substitution. Default behavior is changing the first occurence in each line, unless the option -g is used.

# Usage
# 8_sedwrapper.sh [-g (global flag)] <find> <replace> <textfile>

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
	echo "Error. Usage: $0 [-g] <find> <replace> <textfile>"
	exit 1
fi

flag=""

while getopts "g" opt; do
	case "$opt" in
	g) flag="g" ;;
	*) echo "invalid flag" ;;
	esac
done

shift "$(($OPTIND-1))"

sed -i -r "s/$1/$2/${flag}" "$3"

cat "$3"

exit 0