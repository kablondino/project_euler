/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>
#include <stdlib.h>

void Eratosthenes_Sieve( size_t, size_t[] );
void count_multiplicity( size_t, size_t[], size_t[] );


int main( int argc, char **argv ) {
	char *ptr;  // Pointer for use in strtol
	// Get the limit from the first command line argument
	size_t limit = strtol( argv[1], &ptr, 10 );
	// Initialize list to hold primes
	size_t prime_list[limit];
	size_t multiplicity[limit];

	Eratosthenes_Sieve( limit, prime_list );
	count_multiplicity( limit, prime_list, multiplicity );

	// Print out the prime number factors and their multiplicities
	for( size_t i = 0; i <= limit; i++ ) {
		if( prime_list[i] == 1 && multiplicity[i] != 0 )
			printf("Number: %ld\tMultiplicity: %ld\n", i, multiplicity[i]);
	}

	return 0;
}


void Eratosthenes_Sieve( size_t limit, size_t prime_list[] ) {
	// This function sets each element in `prime_list` to be either 0 or 1,
	// composite or prime, which the index is the number is question.

	// Set the first two entries (the numbers 0 and 1) as not prime
	prime_list[0] = 0;
	prime_list[1] = 0;
	// Initialize the rest of the list to be prime
	for( size_t i = 2; i <= limit; i++ ) {
		prime_list[i] = 1;
	}

	// Loop to mark off the values that are not prime, according to the method
	size_t p = 2;
	while( (p*p) <= limit ) {
		if( prime_list[p] == 1 ) {
			for( size_t i = (p*p); i <= limit; i += p ) {
				prime_list[i] = 0;
			}
		}
		p++;
	}
}


void count_multiplicity( size_t target, size_t prime_list[], size_t multiplicity[] ) {
	// Modifies the `multiplicity` array to house the multiplicity of a number
	// number's prime factorization.

	// Initialize multiplicity array to zeros
	for( size_t i = 0; i <= target; i++ )
		multiplicity[i] = 0;

	// Boolean to be used when the target itself is prime
	int last_prime_bool = 0;

	if( target <= 1 ) {
		multiplicity[1] = 1;
		return;
	}

	while( target % 2 == 0 ) {
		multiplicity[2] += 1;
		target /= 2;
		last_prime_bool = 1;
	}

	for( size_t j = 3; j <= target; j += 2 ) {
		while( target % j == 0 ) {
			multiplicity[j] += 1;
			target /= j;
			last_prime_bool = 1;
		}
	}

	if( last_prime_bool == 0 )
		multiplicity[target] = 1;
}

