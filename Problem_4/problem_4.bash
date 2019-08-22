#!/bin/bash

#=============================================================================
#	Problem 4: Largest palindrome product
#
#	A palindromic number reads the same both ways. The largest palindrome made
#	from the product of two 2-digit numbers is 9009 = 91 × 99.
#
#	Find the largest palindrome made from the product of two 3-digit numbers.
#=============================================================================


max_palindrome=0
final_i=0
final_j=0

for (( i=999; i>=100; i-- )); do
	(( i_squared = i*i ))  # Define possible answer
	for (( j=i; j<=999; j++ )); do  # Inner loop to count UPWARDS with `j`
		(( i_squared += i ))  # Increment possible answer by `i`

		# Pre-screen by making sure the possible answer is bigger than current
		if [ "$i_squared" -gt "$max_palindrome" ]; then

			# Check if the first and last digits are the same (to save time)
			if [ "${i_squared:5:1}" -eq "${i_squared:0:1}" ]; then

				# Check if it's a full palindrome, and then set answer
				if [ "$i_squared" -eq "$(echo -n "$i_squared" | rev)" ]; then
					final_i=$i
					final_j=$(( j + 1 ))  # 1 bigger, since decrementing j
					max_palindrome=$i_squared
				fi
			fi
		fi
	done
done

printf "%d * %d = %d\n" $final_i $final_j $max_palindrome

