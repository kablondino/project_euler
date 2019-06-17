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

#include <stdio.h>


long adjacent_digits_product( int, int, int[] );


int main() {

	FILE *fp;
	int length_of_file = 1020;  // Includes newline chars and \0
	// Mark how many of the chars will be eliminated
	int non_digit_chars = 20;
	// Temporary character buffer for reading in all chars from file
	char buff[length_of_file];

	// Open the file and read it in to `buff` (including \n and \0)
	fp = fopen("./large_number.dat", "r");
	fread( buff, 1, length_of_file, fp );
	// Initialize the digit array, with size ignoring \n and \0 chars
	int input_large_number[length_of_file - non_digit_chars];
	int buffer_index = 0;  // Index to track reading characters from file

	// Populate the digit array, taking care of skipping the newline chars
	for( int i = 0; i < length_of_file; i++ ) {
		if( buff[i] != '\n' ) {
			// Set element, properly casting `char` to `int` with - '0'
			input_large_number[buffer_index] = buff[i] - '0';
			buffer_index++;
		}
		else { continue; }
		if( buff[i] == '\0' ) { break; }
	}

	// Get size of current `input_large_number`
	int len_input_large_number = sizeof(input_large_number) /
		sizeof(input_large_number[0]);


	const int adjacent_length = 13;
	// Array to hold final answer digits
	int permanent_digits[adjacent_length];

	// Temporary variable to store the calculated product
	long the_product;
	// Final answer, to be checked inside the loop
	long largest_product;

	// Loop through the chunk of digits, finding the largest product
	for( int i = 0; i <= len_input_large_number - adjacent_length; i++ ) {
		the_product = adjacent_digits_product( i, adjacent_length,
				input_large_number );

		// Check for largest product, and also set digits for printing
		if( the_product > largest_product ) {
			largest_product = the_product;
			for( int j = 0; j < adjacent_length; j++ ) {
				permanent_digits[j] = input_large_number[i + j];
			}
		}
	}

    // Format and do all the pretty printing
	for( int k = 0; k < adjacent_length - 1; k++ ) {
		printf("%d*", permanent_digits[k]);
	}
	printf("%d = %ld\n", permanent_digits[adjacent_length - 1],
			largest_product);

	return 0;
}


long adjacent_digits_product( int index, int length, int digit_array[] ) {
	// Calculate the product of the digits from a sub array of
	// `digit_array`, with `length` as the length of the subarray
	long product = 1;

	for( int i = 0; i < length; i++ ) {
		if( digit_array[index + i] == 0 ) {
			product = 0;
			break;
		}
		else
			product *= digit_array[index + i];
	}

	return product;
}
