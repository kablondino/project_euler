/*****************************************************************************
 * Problem 9: Special Pythagorean triplet
 *
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for
 * which,
 * 		a^2 + b^2 = c^2
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
*****************************************************************************/

package main

import (
	"fmt"
)

func main() {
	for a := 1; a <= 1000; a++ {
		for b := 1; b <= 1000 - a; b++ {
			c := 1000 - (a + b)
			if( (a*a + b*b) == c*c && a < b ) {
				fmt.Printf("%d*%d*%d = %d\n", a, b, c, a*b*c)
			}
		}
	}
}
