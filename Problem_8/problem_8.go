/*****************************************************************************
 * The four adjacent digits in the 1000-digit number that have the greatest
 * product are 9 × 9 × 8 × 9 = 5832.
 *
 * 		73167176531330624919225119674426574742355349194934
 * 		96983520312774506326239578318016984801869478851843
 * 		85861560789112949495459501737958331952853208805511
 * 		12540698747158523863050715693290963295227443043557
 * 		66896648950445244523161731856403098711121722383113
 * 		62229893423380308135336276614282806444486645238749
 * 		30358907296290491560440772390713810515859307960866
 * 		70172427121883998797908792274921901699720888093776
 * 		65727333001053367881220235421809751254540594752243
 * 		52584907711670556013604839586446706324415722155397
 * 		53697817977846174064955149290862569321978468622482
 * 		83972241375657056057490261407972968652414535100474
 * 		82166370484403199890008895243450658541227588666881
 * 		16427171479924442928230863465674813919123162824586
 * 		17866458359124566529476545682848912883142607690042
 * 		24219022671055626321111109370544217506941658960408
 * 		07198403850962455444362981230987879927244284909188
 * 		84580156166097919133875499200524063689912560717606
 * 		05886116467109405077541002256983155200055935729725
 * 		71636269561882670428252483600823257530420752963450
 * 
 * Find the thirteen adjacent digits in the 1000-digit number that have the
 * greatest product. What is the value of this product?
*****************************************************************************/

package main

import (
	"fmt"
	"io/ioutil"
	"regexp"
	"strconv"
)


func get_digits() (digit_array []int64) {
	// Read in number from file
	content, err := ioutil.ReadFile("large_number.dat")
	if err != nil {
		fmt.Println("Could not open file for large number.")
	}

	// Remove the \n (newline characters) so that it is one long string
	// of numbers
	re := regexp.MustCompile("\\n")
	the_large_number := re.ReplaceAllString(string(content), "")

	// Convert the long string of numbers into an array of integers
	for _, character_value := range the_large_number {
		i, err := strconv.ParseInt(string(character_value), 10, 0)
		if err != nil {
			panic(err)
		}

		digit_array = append(digit_array, i)
	}

	return
}


func adjacent_digits_product( index, length int64, digit_array []int64 ) int64 {
	// Calculate the product of the digits from a sub array of
	// `digit_array`, with `length` as the length of the subarray
	var product int64 = 1

	for i := int64(0); i < length; i++ {
		product *= digit_array[index + i]
	}

	return product
}


func main() {
	// Length of subarray
	const adjacent_length int64 = 13
	// Initialize answer
	var largest_product int64 = 0
	// Array of digits that will be the constituent digits that multiply
	// to the answer
	var permanent_digits []int64

	// Input the number as a large int64 array
	digit_array := get_digits()

	// Loop through chunks of digits, and set the largest
	for j := int64(0); j < int64(len(digit_array)) - adjacent_length; j++ {
		current_array := digit_array[j : j + adjacent_length]
		product := adjacent_digits_product(j, adjacent_length, digit_array)

		if product > largest_product {
			largest_product = product
            // Save the max digits, also, for use in pretty printing
			permanent_digits = current_array
		}
	}

    // Format and do all the pretty printing
	for k := int64(0); k < adjacent_length - 1; k++ {
		fmt.Printf("%d*", permanent_digits[k])
	}
	fmt.Printf("%d = %d\n", permanent_digits[adjacent_length - 1],
		largest_product)
}

