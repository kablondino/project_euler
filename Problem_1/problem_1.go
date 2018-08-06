/*
 *	Problem 1: Multiples of 3 and 5
 *
 *	If we list all the natural numbers below 10 that are multiples of 3
 *	or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 *	Find the sum of all the multiples of 3 or 5 below 1000.
 */

package main

import( "fmt" )

var s3, s5, s15 int

func main() {
	for j := 0; j < 1000; j++ {
		if j % 3 == 0 { s3 += j }
		if j % 5 == 0 { s5 += j }
		if j % 15 == 0 { s15 += j }
	}
	fmt.Println( s3 + s5 - s15 )
}

