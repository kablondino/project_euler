/*****************************************************************************
 * Problem 3
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
*****************************************************************************/

#include <stdio.h>


int main() {
	const unsigned long long int the_target = 600851475143;
	unsigned long long int current_number = the_target;

	int i = 3;    // Divisor
	int high = 0; // Highest factor, to be assigned

	while( 1 )
	{
		while( !(current_number % i) )
		{
			current_number = current_number / i;
			high = i;
		}

		if ( current_number == 1 ) { break; }

		i += 2;
	}

	printf("Largest prime factor of %llu is %d\n", the_target, high);

	return 0;
}

