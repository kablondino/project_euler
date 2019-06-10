/*
 * 2520 is the smallest number that can be divided by each of the numbers from
 * 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
*/

package main

import (
	"fmt"
)


func greatest_common_denominator(a, b uint64) uint64 {
	for a != b {
		if a > b {
			a = a - b
		} else {
			b = b - a
		}
	}

	return a
}


func least_common_multiple(a, b uint64) uint64 {
	return ((a*b) / greatest_common_denominator(a, b))
}


func main() {
	var answer uint64 = 1
	for i := uint64(2); i <= 20; i++ {
		answer = least_common_multiple(answer, i)
	}

	fmt.Println(answer)
}

