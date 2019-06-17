/*****************************************************************************
 * Problem 10: Summation of primes
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
*****************************************************************************/

#include <stdio.h>


int main() {
	const int limit = 2.0e6;
	int the_sieve[limit];

    // Initialize the entire boolean sieve to true
    // `.false.` means composite (not prime)
	for( int i = 0; i < limit; i++ ) {
		the_sieve[i] = 1;
	}

    // Incremental sieve in which the multiples of each prime `p` are
	// generated directly by counting up from the square of the prime in
	// increments of `p`.
	int p = 2;
	for(; (p*p) < limit; p++ ) {
		if( the_sieve[p] == 1 ) {
			for( int j = (p*p); j < limit; j += p ) {
				the_sieve[j] = 0;
			}
		}
	}

    // Sum the indices of the `the_sieve` array that are still .true.
	unsigned long int the_sum = 0;
	for( int k = 2; k <= limit; k++ ) {
		if( the_sieve[k] == 1 ) {
			the_sum += k;
		}
	}

	printf("%lu\n", the_sum);

	return 0;
}

