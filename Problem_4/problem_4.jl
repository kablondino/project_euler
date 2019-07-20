#=
    Problem 4: Largest palindrome product

    A palindromic number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.
=#


# Function to check if product is palindrome
function is_palindrome(a, b)
	# Convert the product to a string, and check if it is itself backwards
	if string(a*b) == reverse(string(a*b))
		return true
	else
		return false
	end
end


# Store all palindromes of this problem in one dictionary, with the keys being
# the palindrome and the values being a tuple of the factors
# This order DIFFERS from the python solution!
list_palindrome = Dict{Int, Tuple{Int, Int}}()

# Start from 999, and loop downwards to find palindrome
for i = 999 : -1 : 100
	for j = i : -1 : 100
		if is_palindrome(i, j) == true
			list_palindrome[i*j] = (i, j)  # Populate the dictionary
		end
	end
end

# Set some convenience variables to aid in printing the answer
first_factor = maximum(list_palindrome)[2][1]
second_factor = maximum(list_palindrome)[2][2]

largest_palindrome = maximum(list_palindrome)[1]

println("$first_factor * $second_factor = $largest_palindrome")
