#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 18/09/2022
# Last Modified: 27/09/2022

# Description
# Checks if the given paths are valid and whether if they point to directories or files.

# Usage
# 1_valid_path.sh [path] ...

for arg in "$@"; do
	if [ -e ${arg} ] && [ -f ${arg} ]; then
		echo "Valid path & is a file: ${arg}"
	elif [ -e ${arg} ] && [ -d ${arg} ]; then
		echo "Valid path & is a directory: ${arg}"
	else
		echo "Invalid path: ${arg}"
	fi
done

exit 0