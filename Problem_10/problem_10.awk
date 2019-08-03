#!/usr/bin/awk -f

#=============================================================================
#    Problem 10: Summation of primes
#
#    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#    Find the sum of all the primes below two million.
#=============================================================================#


BEGIN {
	limit = 2.0e6

	# Initialize the entire boolean sieve to true
	# `.false.` means composite (not prime)
	for(i = 0; i < limit; i++) {
		the_sieve[i] = 1;
	}

	# Incremental sieve in which the multiples of each prime `p` are
	# generated directly by counting up from the square of the prime in
	# increments of `p`.
	p = 2
	for(p = 2; p^2 < limit; p++) {
		if(the_sieve[p] == 1) {
			for(j = p^2; j < limit; j += p) {
				the_sieve[j] = 0
			}
		}
	}

	# Sum the indices of the `the_sieve` array that are still .true.
	for(k = 2; k <= limit; k++) {
		if(the_sieve[k] == 1) {
			the_sum += k
		}
	}

	printf "%d\n", the_sum
}

