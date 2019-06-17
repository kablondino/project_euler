/*****************************************************************************
 * Problem 7: 10001st prime
 *
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 * that the 6th prime is 13.
 *
 * What is the 10,001st (ten-thousand first) prime number?
*****************************************************************************/

package main

import (
	"fmt"
	"math"
)


func is_prime ( number int ) bool {
	// Exit out for negative numbers, 0, and 1
	if number <= 1 {
		return false
	}

    // Check for even numbers
	if number == 2 {
		return true
	} else if number % 2 == 0 {
		return false
	}

	// Loop for odd numbers
	for i := 3; i <= int(math.Sqrt(float64(number))); i++ {
		if number % i == 0 { return false }
	}

	// If it went through all of the conditions, it must be prime
	return true
}


func main() {
    // Initialize the looping counter and the intended answer
	var counter int = 1
    var target int = 3

	for ; counter < 10001; {
        if is_prime(target) == true { counter += 1 }
        target += 2  // Increment to the next odd number
	}

    target -= 2  // Eliminate the last increment of 2 from the last loop

    fmt.Printf("The %d prime number is %d\n", counter, target)
}

