#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 19/09/2022
# Last Modified: 27/09/2022

# Description
# Takes a list of URL's as a text file and downloads them into the given directory using wget.

# Usage
# 6_listdl.sh <URL list> <target directory>

if [ "$#" -ne 2 ] || [ ! -f "$1"  ]; then
	echo "Exactly 2 parameters are expected, and the first one has to exist. Usage: "
	echo "$0 <file containing URLs> <target directory>"
	exit 1
fi

mkdir -p "$2"

cat "$1" | xargs -p -n1 wget -q --show-progress -P "$2"

exit 0
