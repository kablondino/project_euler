/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>
#include <stdlib.h>

void Eratosthenes_Sieve( int, int[] );


int main( int argc, char **argv ) {
	char *ptr;  // Pointer for use in strtol
	// Get the limit from the first command line argument
	int limit = strtol( argv[1], &ptr, 10 );
	// Initialize list to hold primes
	int prime_list[limit];

	Eratosthenes_Sieve( limit, prime_list );

	for( int i = 0; i <= limit; i++ ) {
		if( prime_list[i] == 1 )
			printf("%d ", i);
	}

	return 0;
}


void Eratosthenes_Sieve( int limit, int prime_list[] ) {
	// This function sets each element in `prime_list` to be either 0 or 1,
	// composite or prime, which the index is the number is question.

	// Set the first two entries (the numbers 0 and 1) as not prime
	prime_list[0] = 0;
	prime_list[1] = 0;
	// Initialize the rest of the list to be prime
	for( int i = 2; i < limit; i++ ) {
		prime_list[i] = 1;
	}

	// Loop to mark off the values that are not prime, according to the method
	int p = 2;
	while( (p*p) <= limit ) {
		if( prime_list[p] == 1 ) {
			for( int i = (p*p); i <= limit; i += p ) {
				prime_list[i] = 0;
			}
		}
		p++;
	}
}

