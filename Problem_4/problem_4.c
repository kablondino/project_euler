/*
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 * Find the largest palindrome made from the product of two 3-digit numbers.
*/

/* NOTE that this is not the best way to solve this problem. A much better way
 * is by not bothering with converting to a string. See the alternative C
 * program.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int is_palindrome( unsigned long int a, unsigned long int b );
char *strrev( char forward_string[] );


int main() {
	unsigned int max_palindrome = 0;  // Initialized final answer
	int final_i = 0;
	int final_j = 0;

	for( int i = 999; i >= 100; i-- ) {
		for( int j = i; j >= 100; j-- ) {
			if( is_palindrome(i, j) == 1 && max_palindrome < i*j ) {
					final_i = i; final_j = j;
					max_palindrome = i*j;
			}
		}
	}

	printf( "%d * %d = %d\n", final_i, final_j, max_palindrome );

	return 0;
}


int is_palindrome( unsigned long int a, unsigned long int b ) {
	// Check if the number is a palindrome by converting the product to a
	// string and then comparing it to a reversed version of itself.

	char possible_palindrome[12];  // Any 64-bit unsigned integer will fit this
	// possible_palindrome becomes a string
	sprintf( possible_palindrome, "%lu", a*b );
	// Make a new string that is the reverse of possible_palindrome
	char *possible_reversed = strrev(possible_palindrome);

	// Declare integer versions of the strings above
	int int_possible_palindrome = strtol( possible_palindrome, NULL, 10 );
	int int_possible_reversed = strtol( possible_reversed, NULL, 10 );

	if( int_possible_palindrome == int_possible_reversed ) { return 1; }
	else { return 0; }
}


char *strrev( char forward_string[] ) {
	// Reverses a string, and returns it as a char array
	int length = strlen( forward_string );
	// Initialize reversed string
	char *reversed_string = (char *) malloc( sizeof(char) * length );

	for( int k = 0; k <= length; k++ ) {
		reversed_string[k] = forward_string[length - k - 1];
	}

	return reversed_string;
}

