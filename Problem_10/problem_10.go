/*****************************************************************************
 * Problem 10: Summation of primes
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
*****************************************************************************/

package main

import ( "fmt" )


func main() {
	const limit int = 2.0e6
	var the_sieve [limit]bool

	// Initialize the entire boolean sieve to true
	// `.false.` means composite (not prime)
	for i := 0; i < limit; i++ {
		the_sieve[i] = true;
	}

	// Incremental sieve in which the multiples of each prime `p` are
	// generated directly by counting up from the square of the prime in
	// increments of `p`.
	p := 2;
	for ; (p*p) < limit; p++ {
		if the_sieve[p] == true {
			for j := (p*p); j < limit; j += p {
				the_sieve[j] = false
			}
		}
	}

	// Sum the indices of the `the_sieve` array that are still .true.
	var the_sum int64 = 0
	for k := 2; k < limit; k++ {
		if the_sieve[k] == true {
			the_sum += int64(k)
		}
	}

	fmt.Println(the_sum)
}

