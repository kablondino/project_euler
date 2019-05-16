/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 *
 * What is the 10,001st (ten-thousand first) prime number?
*/

#include <stdio.h>
#include <math.h>


int is_prime( int number ) {
    // Exit out for negative numbers, 0, and 1
	if( number <= 1 ) { return 0; }

	if( number == 2 ) { return 1; }
	else if( number % 2 == 0 ) { return 0; }

	int i = 3;
	while( i < sqrt(number) + 1 ) {
		if( number % i == 0 ) {
			return 0;
		}
		i++;
	}

    // If it went through all of the conditions, it must be prime
	return 1;
}


int main() {
    // Initialize the looping counter and the intended answer
    int counter = 1;
	int target = 3;

	while( counter < 10001 ) {
		if( is_prime(target) == 1 ) { counter += 1; }
		target += 2;  // Increment to the next odd number
	}

	target -= 2;  // Eliminate the last increment of 2 from the last loop

	printf("The %d prime number is %d", counter, target);

	return 0;
}

