#!/usr/bin/awk -f

#=============================================================================
#	Problem 7: 10001st prime
#
#	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
#	that the 6th prime is 13.
#
#	What is the 10,001st (ten-thousand first) prime number?
#=============================================================================


function is_prime(number) {
	# Exit out for negative numbers, 0, 1, and non-integers
	if(number <= 1) { return 0 }

	# Check for even numbers
	if(number == 2) { return 1 }
	else if(number % 2 == 0) { return 0 }

	# Initialize and loop for odd numbers
	i = 3
	while(i <= int(sqrt(number))) {
		if(number % i == 0) { return 0 }
		i += 1
	}

	# If it went through all of the conditions, it must be prime
	return 1
}


BEGIN {
	# Initialize the looping counter and the intended answer
	counter = 1
	target = 3

	while(counter < 10001) {
		if(is_prime(target) == 1) {
			counter += 1
		}
	target += 2  # Increment to the next odd number
	}

	target -= 2  # Eliminate the last increment of 2 from the last loop

	printf "The %d prime number is %d\n", counter, target
}
