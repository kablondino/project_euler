#!/bin/bash

#=============================================================================
#	Problem 3: Largest prime factor
#
#	The prime factors of 13195 are 5, 7, 13 and 29.
#
#	What is the largest prime factor of the number 600851475143 ?
#=============================================================================


the_target=600851475143
current=$the_target

i=3

while :; do
	while [ $(( current % i )) -eq 0 ]; do
		current=$(( current / i ))
		high=$i
	done

	if [ $current -eq 1 ]; then
		break
	fi

	i=$(( i + 2 ))
done

printf "Largest prime factor of %d is %d\n" $the_target $high

