#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 21/09/2022
# Last Modified: 27/09/2022

# Description
# Uses awk to create a matrix from a text file and label each entry with their respective coordinates in the matrix. Demonstration:
# This    Is          ->       1,1: This      1,2: Is
# An    Example                2,1: An        2,2: Example

# Usage
# 11_matrixer.sh [-d (dimensions)] <textfile>

dMode=0

while getopts "d" opt; do
	case "$opt" in
	d) dMode=1 ;;
	*) ;;
	esac
done
shift "$(($OPTIND-1))"

if [ $# -ne 1 ]; then
	echo "Usage: $0 <textfile>"
fi


awk -v dMode=$dMode -v field=-1 -v uniform="true" '
dMode==0 {line=""; for (i = 1; i <= NF; i++) {line = line NR "," i ": " $i "\t"} print line;}
dMode==1 && NR==1 {field = NF;}
dMode==1 {print NR ", " NF; if (NF != field) uniform="false";}
END {if (dMode == 1) print "Uniform width: " uniform;}
' "$1"

exit 0
