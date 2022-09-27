#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 20/09/2022
# Last Modified: 27/09/2022

# Description
# Demultiplexer that takes a list of RNA sequences and sorts them into different files using the provided marker information. Check the files 7_marker_list.txt and 7_seq_data.txt to see the expected input format.

# Usage
# 7_demux.sh <marker list file> <sequence data file>

if [ "$#" -ne 2 ] || [ ! -e "$1" ] || [ ! -e "$2" ]; then
	echo "Faulty arguments. Usage: "
	echo "$0 <marker list file> <sequence data file>"
	exit 1
fi

while read line; do
	marker=$(echo "${line}" | cut -d " " -f 1)
	sequence=$(echo "${line}" | cut -d " " -f 2)

	if [ $(grep -E --count "^${marker}" $1) -eq 0 ]; then
		echo "Marker ${marker} couldn't be found in the marker list."
		echo ${sequence} >> UNMARKED
	else
		echo ${sequence} >> ${marker}
	fi

done < "$2"
