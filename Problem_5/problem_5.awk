#!/usr/bin/awk -f

#=============================================================================
#	Problem 5: Smallest multiple
#
#	2520 is the smallest number that can be divided by each of the numbers from
#	1 to 10 without any remainder.
#
#	What is the smallest positive number that is evenly divisible by all of the
#	numbers from 1 to 20?
#=============================================================================


function Eratosthenes_Sieve(limit) {
	# Boolean list in which the position represents is_prime. Initialize to
	# everything is True (a prime)
	for(i = 1; i <= limit; i++) {
		prime_check[i] = 1
	}

	# Incremental sieve in which the multiples of each prime `p` are generated
	# by counting up from the square of the prime in increments of `p`
	p = 2
	while(p^2 <= limit) {
		if(prime_check[p] == 1) {
			# Update all multiples of p up to the limit to not prime
			for(j = p^2; j <= limit; j += p) {
				prime_check[j] = 0
			}
		}
		p += 1
	}

	# Populate the returned prime_list
	for(p = 2; p <= limit; p++) {
		if(prime_check[p] == 1) {
			prime_list[p] = p
		}
	}

	return prime_list
}


BEGIN {
	printf "%d\n", Eratosthenes_Sieve(100)
}

