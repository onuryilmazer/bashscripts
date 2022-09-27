#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 18/09/2022
# Last Modified: 27/09/2022

# Description
# Asks the user to guess a random number between 1 and 10 (both inclusive) until they get it right.

# Usage
# 2_random_guess.sh

rnd=$(( $RANDOM%10 + 1 ))
guess=""

while [ true ]; do
	read -p "Pick a number btw. 1-10: " guess

	if [ $guess -eq $rnd ]; then
		echo "Correct"
		break
	else
		echo "Wrong"
	fi
done

exit 0