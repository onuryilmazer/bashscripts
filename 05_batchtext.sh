#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 19/09/2022
# Last Modified: 27/09/2022

# Description
# Changes the extensions of given files, if they actually exist. Supports wildcards.

# Usage
# 5_batchtext.sh <new extension> <file> ...

if [ ${#} -lt 2 ]; then
	echo "2 arguments at minimum are expected. Usage: "
	echo "$0 <new file extension> <file> ..."
	exit 1
fi

if [ ${#1} -gt 4 ] || [ ${#1} -lt 1 ]; then
	echo "The file extension argument has the wrong length."
	echo "It needs to be 4 characters max, and be provided without the leading dot."
	exit 1
fi

extension=${1}

shift 1

for file in "$@"; do
	if [ ! -e "${file}" ]; then
		echo "File ${file} does not exist, skipping it."
		continue
	elif [ $(realpath "$file") = $(realpath "${0}") ]; then
		echo "It's rather rude of you to ask a script to rename itself, isn't it?"
		continue
	fi

	#parameter expansion w/ % removes existing file extensions, if there are any:
	new_file="${file%.*}.${extension}"
	mv "$file" "$new_file"
	echo "Renamed ${file} as ${new_file}"
done

exit 0