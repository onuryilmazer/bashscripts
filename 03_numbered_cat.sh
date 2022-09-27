#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 18/09/2022
# Last Modified: 27/09/2022

# Description
# Prints all given files into stdout and numbers each line.

# Usage
# 3_numbered_cat.sh [file] ...

for file in "$@"; do
	if [ ! -e "$file" ]; then
		echo "File ${file} does not exist."
		continue
	fi

	lineNumber=0
	while read line; do
		lineNumber=$(( lineNumber + 1 ))
		echo " ${lineNumber}: ${line}"
	done < ${file}
done

exit 0