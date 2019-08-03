#!/usr/bin/awk -f

#=============================================================================
#	Problem 3: Largest prime factor
#
#	The prime factors of 13195 are 5, 7, 13 and 29.
#
#	What is the largest prime factor of the number 600851475143 ?
#=============================================================================


BEGIN {
	the_target = 600851475143
	current = the_target

	i = 3

	while(1) {
		while(current % i == 0) {
			current /= i
			high = i
		}

		if(current == 1) {
			break
		}

		i += 2
	}

	printf "Largest prime factor of %d is %d\n", the_target, high
}

