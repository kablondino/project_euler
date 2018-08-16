/*
 * Problem 3
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
*/

package main

import ( "fmt" )

func main() {
	const the_target uint64 = 600851475143
	current := 600851475143

	var i,high int = 3, 0

	for true {
		for ( (current % i) == 0 ) {
			current /= i
			high = i
		}

		if( current == 1 ) {
			break
		}
		i += 2
	}
	fmt.Printf("Largest prime factor of %d is %d\n", the_target, high)
}

