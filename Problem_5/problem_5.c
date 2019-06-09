/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>


void Eratosthenes_Sieve( int, int[], int[] );
void remove_zeros_in_array( int[] );
void count_multiplicity( int, int[], int[] );


int main( int argc, char **argv ) {
	char *ptr;  // Pointer for use in strtol
	// Get the limit from the first command line argument
	int limit = strtol( argv[1], &ptr, 10 );
	// Initialize list to hold primes
	int number_array_prime_bool[limit];

	// List of primes, with extraneous zeros at end
	int prime_list[limit];
	// List of multiplicities, in which the index corresponds with the above's
	// array index
	int multiplicity[limit];

	/* PRINT OUT ALL THE RESULTS OF THE FUNCTIONS (not the answer)
	for( int j = 0; prime_list[j] != 0; j++ ) {
		printf("%d %d\n", j, prime_list[j]);
	}

	printf("\nTarget: %d\n", limit);
	for( int i = 0; i <= limit; i++ ) {
		if( number_array_prime_bool[i] == 1 && multiplicity[i] != 0 )
			printf("Prime Factor: %d\tMultiplicity: %d\n", i, multiplicity[i]);
	}
	*/

	// Kinda useless stuff since it doesn't go far enough
	// This is trying to do exactly what the python program does, which is difficult
	int ith_factorization_prime, ith_factorization_multi;
	for( int j = 2; j <= 100; j++ ) {
		// Clear previous lists
		for( int k = 0; k <= (sizeof(prime_list)/sizeof(prime_list[0])); k++ ) {
			prime_list[k] = 0; multiplicity[k] = 0;
		}
		Eratosthenes_Sieve( j, number_array_prime_bool, prime_list );
		count_multiplicity( j, prime_list, multiplicity );
		printf("Counter: %d, Factor: %d, Multiplicity: %d\n", j, prime_list[j], multiplicity[j]);

//		ith_factorization_prime = prime_list[j];
//		ith_factorization_multi = multiplicity[j];
//		for( int k = ith_factorization_prime; ; k++ ) {
//			if( ith_factorization_prime[k] > max_powers_dict[k] )
//				max_powers_dict[k] = 
//		}
	}

	return 0;
}


void Eratosthenes_Sieve( int limit, int number_array_prime_bool[],
		int prime_list[] ) {
	// This function sets each element in `number_array_prime_bool` to be
	// either 0 or 1, corresponding to composite or prime. The index of the
	// array represents the number itself.

	// Set the first two entries (the numbers 0 and 1) as not prime
	number_array_prime_bool[0] = 0;
	number_array_prime_bool[1] = 0;
	// Initialize the rest of the list to be prime
	for( int i = 2; i <= limit; i++ ) {
		number_array_prime_bool[i] = 1;
	}

	// Loop to mark off the values that are not prime, according to the method
	int p = 2;  // Start at 2
	while( (p*p) <= limit ) {
		if( number_array_prime_bool[p] == 1 ) {
			for( int i = (p*p); i <= limit; i += p ) {
				number_array_prime_bool[i] = 0;
			}
		}
		p++;
	}

	int l = 0;  // Counter for prime_list, NOT number_array_prime_bool
	for( int j = 0; j <= limit; j++ ) {
		if( number_array_prime_bool[j] >= 1 ) {
			prime_list[l] = j;
			l++;
		}
	}
}


void count_multiplicity( int target, int prime_list[],
		int multiplicity[] ) {
	// Modifies the `multiplicity` array to house the multiplicity of a number
	// number's prime factorization.

	// Initialize multiplicity array to zeros
	for( int i = 0; i <= target; i++ )
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

	for( int j = 3; j <= target; j += 2 ) {
		while( target % j == 0 ) {
			multiplicity[j] += 1;
			target /= j;
			last_prime_bool = 1;
		}
	}

	if( last_prime_bool == 0 )
		multiplicity[target] = 1;
}

