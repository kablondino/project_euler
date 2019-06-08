/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int Eratosthenes_Sieve( int *, int );
int Sieve( int *, int );


int main() {
	int *array, n = 100;
	array = (int *) malloc((n + 1) * sizeof(int));
	printf("ANSWER! %d", Eratosthenes_Sieve(array, n));

	return 0;
}


int Eratosthenes_Sieve( int *prime_list, int limit ) {
    // Boolean list in which the position represents is_prime. Initialize to
    // everything is True (a prime)
	int prime_check[limit];
	memset( prime_check, 0, limit*sizeof(int) );

	for( int i = 0; i < limit; i++ ) {
		prime_list[i] = 1;
	}

	int p = 2;
	while( p*p <= limit ) {
		if( prime_check[p] == 1 ) {
			for( int j = p*p; j <= limit; j += p ) {
				prime_check[j] = 0;
			}
		}
		p++;
	}

	int k = 0;
	for( p = 2; p <= limit; p++ ) {
		if( prime_check[p] == 1 ) {
			prime_list[k] = p;
		}
		k++;
	}

	return prime_list;
}

