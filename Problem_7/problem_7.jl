#=============================================================================
	Problem 7: 10001st prime

	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
	that the 6th prime is 13.

	What is the 10,001st (ten-thousand first) prime number?
=============================================================================#


function is_prime(number)
	# Exit out for negative numbers, 0, 1, and non-integers
	if number <= 1
		return false
	end

	# Check for even numbers
	if number == 2
		return true
	elseif number % 2 == 0
		return false
	end

	# Initialize and loop for odd numbers
	i = 3
	while i <= Int(round(number^0.5))
		if number % i == 0
			return false
		end
		i += 1
	end

	# If it went through all of the conditions, it must be prime
	return true
end


# Initialize the looping counter and the intended answer
counter, target = 1, 3

while counter < 10001
	if is_prime(target) == true
		global counter += 1
	end
	global target += 2  # Increment to the next odd number
end

target -= 2  # Eliminate the last increment of 2 from the last loop

print("The $counter prime number is $target")
