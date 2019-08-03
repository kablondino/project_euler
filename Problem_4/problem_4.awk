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
#function is_palindrome(forward_integer) {
#	# Initialize reversed integer
#	reversed_integer = ""
#
#	# Reverse the string
#	for(i = length(forward_integer); i > 0; i--) {
#		reversed_integer = reversed_integer substr(forward_integer, i, 1)
#	}
#
#	# Check if it is itself backwards
##	printf "Forward: %d, Reversed: %d\n", forward_integer, reversed_integer
#	if(forward_integer == reversed_integer) { return 1 }
#	else { return 0 }
#}


BEGIN {
	max_palindrome = 0
	final_i = 0
	final_j = 0

	for(i = 999; i >= 100; i--) {
		for(j = i; j >= 1; j--) {
			# Reset the reversed_integer
			reversed_integer = ""

			# Reverse the string and store it
			for(k = length(i*j); k > 0; k--) {
				reversed_integer = reversed_integer substr(i*j, k, 1)
			}

			if(i*j == reversed_integer && max_palindrome < i*j) {
				final_i = i
				final_j = j
				max_palindrome = i*j
			}

		}
	}

	printf "%d * %d = %d\n", final_i, final_j, max_palindrome
}

