#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 21/09/2022
# Last Modified: 27/09/2022

# Description
# Uses awk to handle a formatted text file as a matrix and extract a certain part of it according to given matrix coordinates. 3x3 matrix usage demonstration:
# 23  1     0         2-3, 2-3 slice:         1337    7
# 42  1337  7                                 0       69
# 0   0     69

# Usage
# 12_slicer.sh <fromRow-toRow> <fromColumn-toColumn> <matrix file>

if [ "$#" -ne 3 ] || [ ! -f "$3" ]; then
	echo "Usage: $0 <fromRow-toRow> <fromColumn-toColumn> <existing matrix file>"
	exit 1
fi

stRow=${1%%-*}
endRow=${1##*-}

stCol=${2%%-*}
endCol=${2##*-}

awk -v stRow=$stRow -v endRow=$endRow -v stCol=$stCol -v endCol=$endCol '
BEGIN {FS="\t"}
NR >= stRow && NR <= endRow {line="";
	for (i = 1; i <= NF; i++){ if (i >= stCol && i <= endCol) line = line $i "\t"; }
	print line;
}' "$3"

exit 0