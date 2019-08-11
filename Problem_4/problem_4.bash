#!/bin/bash

#=============================================================================
#	Problem 4: Largest palindrome product
#
#	A palindromic number reads the same both ways. The largest palindrome made
#	from the product of two 2-digit numbers is 9009 = 91 × 99.
#
#	Find the largest palindrome made from the product of two 3-digit numbers.
#=============================================================================
# Function to check if product is palindrome


function is_palindrome() {
	local reversed_integer=$(echo $1 | rev)

	if [ $reversed_integer -eq $1 ]; then
		return 0
	else
		return 1
	fi
}


max_palindrome=0
final_i=0
final_j=0

for (( i=999; i>=100; i-- )); do
	for (( j=i; j>=100; j-- )); do
		if [ $(is_palindrome $(( i*j ))) -eq 0 ]; then
			final_i=$i
			final_j=$j
			max_palindrome=$(( i*j ))
		fi
	done
done

printf "%d * %d = %d\n" $final_i $final_j $max_palindrome

