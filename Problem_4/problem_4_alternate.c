/*
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 * Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stdio.h>


int reverse_integer( int forward_integer );
int is_palindrome( int a, int b );

int main() {
	unsigned int max_palindrome = 0;  // Initialized final answer
	int final_i = 0;
	int final_j = 0;

	for( int i = 999; i >= 100; i-- ) {
		for( int j = i; j >= 100; j-- ) {
			if( is_palindrome(i*j, reverse_integer(i*j)) && max_palindrome < i*j ) {
				final_i = i; final_j = j;
				max_palindrome = i*j;
			}
		}
	}

	printf( "%d * %d = %d\n", final_i, final_j, max_palindrome );

	return 0;
}


int reverse_integer( int forward_integer ) {
	int remainder;
	int reversed = 0;

	while( forward_integer != 0 ) {
		remainder = forward_integer % 10;
		reversed = reversed*10 + remainder;
		forward_integer /= 10;
	}

	return reversed;
}


int is_palindrome( int a, int b ) {
	if( a == b ) { return 1; }
	else { return 0; }
}

