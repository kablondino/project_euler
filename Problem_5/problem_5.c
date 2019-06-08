/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>

typedef enum { false, true } bool;

int *primes( int limit ) {
	static int prime_list[100];
	int array_position = 0;
	bool else_loop = false;

	for( int val = 1; val < limit + 1; val++ ) {
		if( val > 1 ) {
			for( int n = 2; n < val; n++ ) {
				if( val % n == 0 ) {
					else_loop = true;
					break;
				}
			}
			if( else_loop == true ) {
				prime_list[array_position] = val;
				array_position++;
			}
		}
	}

	return prime_list;
}


int main() {
	int array_length = sizeof(primes(34)) / sizeof(primes(34)[0]);
	for( int i = 0; i < array_length; i++ ) {
		printf("%d %d\n", array_length, *primes( 34 ));
	}

	return 0;
}
