/*****************************************************************************
 * Problem 5: Smallest multiple
 *
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*****************************************************************************/

#include <stdio.h>


#define ulong unsigned long


ulong greatest_common_denominator( ulong, ulong );
ulong least_common_multiple( ulong, ulong );


int main() {
	ulong answer = 1;

	// Find the least common multiple (answer) of all the integers up to 20
	for( int i = 2; i <= 20; i++ )
		answer = least_common_multiple(answer, (ulong) i);

	printf("%lu\n", answer);

	return 0;
}


ulong greatest_common_denominator( ulong x, ulong y ) {
	// Returns, surprise, the greatest common denominator of the two parameters
	// This is Euclid's original GCD algorithm (subtraction-based)
	while( x != y ) {
		if( x > y )
			x = x - y;
		else
			y = y - x;
	}

	return x;
}


ulong least_common_multiple( ulong a, ulong b ) {
	// Transient variable to prevent calculation error in `return` statement
	ulong this_gcd = greatest_common_denominator(a, b);
	return (a*b / this_gcd);
}

