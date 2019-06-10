/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

#include <stdio.h>

#define ulong unsigned long

ulong greatest_common_denominator( ulong, ulong );
ulong least_common_multiple( ulong, ulong );


int main() {
	ulong x = 1;

	for( int i = 2; i <= 20; i++ )
		x = least_common_multiple(x, (ulong) i);

	printf("%lu\n", x);

	return 0;
}


ulong greatest_common_denominator( ulong m, ulong n ) {
	while( m != n ) {
		if( m > n )
			m = m - n;
		else
			n = n - m;
	}

	return m;
}


ulong least_common_multiple( ulong a, ulong b ) {
	ulong this_gcd = greatest_common_denominator(a, b);
	return (a*b / this_gcd);
}
