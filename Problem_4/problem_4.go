/*****************************************************************************
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
*****************************************************************************/

package main

import ( "fmt" )


func main() {
	var max_palindrome, final_i, final_j int = 0, 0, 0

	for i := 999; i >= 100; i-- {
		for j := i; j >= 100; j-- {
			if i*j == reverse_integer(i*j) && max_palindrome < i*j {
				final_i = i; final_j = j
				max_palindrome = i*j
			}
		}
	}

	fmt.Printf( "%d * %d = %d\n", final_i, final_j, max_palindrome )
}


func reverse_integer( forward_integer int ) int {
	var remainder, reversed int

	for forward_integer != 0 {
		remainder = forward_integer % 10
		reversed = reversed*10 + remainder
		forward_integer /= 10
	}

	return reversed
}

