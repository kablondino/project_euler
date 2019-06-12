/*****************************************************************************
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
*****************************************************************************/

#include <stdio.h>


unsigned int reverse_integer( unsigned int forward_integer );


int main() {
	unsigned int max_palindrome = 0;  // Initialized final answer
	unsigned int final_i = 0;
	unsigned int final_j = 0;

	for( unsigned int i = 999; i >= 100; i-- ) {
		for( unsigned int j = i; j >= 100; j-- ) {
			if( i*j == reverse_integer(i*j) && max_palindrome < i*j ) {
				final_i = i; final_j = j;
				max_palindrome = i*j;
			}
		}
	}

	printf( "%d * %d = %d\n", final_i, final_j, max_palindrome );

	return 0;
}


unsigned int reverse_integer( unsigned int forward_integer ) {
	// Reverses the integer by base-10 modulus
	unsigned int remainder;
	unsigned int reversed = 0;

	while( forward_integer != 0 ) {
		remainder = forward_integer % 10;
		reversed = reversed*10 + remainder;
		forward_integer /= 10;
	}

	return reversed;
}

