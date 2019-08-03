#!/usr/bin/awk -f

#=============================================================================
#	Problem 4: Largest palindrome product
#
#	A palindromic number reads the same both ways. The largest palindrome made
#	from the product of two 2-digit numbers is 9009 = 91 × 99.
#
#	Find the largest palindrome made from the product of two 3-digit numbers.
#=============================================================================


# Function to check if product is palindrome
function is_palindrome(a, b) {
	# Reverse the string
	for(i = length(a*b); i != 0; i--) {
		x = x substr(a*b, i, 1);
	}
	# Check if it is itself backwards
	if(a*b == x) { return true }
	else { return false }
}


function reverse_integer(forward_integer) {
	remainder = 0
	reversed = 0

	while(forward_integer != 0) {
		remainder = forward_integer % 10
		reversed = reversed*10 + remainder
		forward_integer /= 10
	}

	return reversed
}


BEGIN {
	max_palindrome = 0
	final_i = 0
	final_j = 0

	for(i = 999; i >= 100; i--) {
		for(j = ; j >= 100; j--) {
			if(i*j == reverse_integer(i*j)) {
				final_i = i
				final_j = j
				max_palindrome = i*j
			}
		}
	}

	printf "%d * %d = %d\n", final_i, final_j, max_palindrome
}

