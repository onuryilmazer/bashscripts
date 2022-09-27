#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 19/09/2022
# Last Modified: 27/09/2022

# Description
# Prints the absolute path for every relative path given as arguments.

# Usage
# 4_abspath.sh [relative path] ...

case "$#" in
	0) echo $PWD ;;
	*)
		for file in "$@"; do
			if [ -e "$file" ]; then
				echo $(realpath "$file")
			else
				echo "File $file does not exist"
			fi
		done
	;;
esac

exit 0