#=============================================================================
	Problem 1: Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3
	or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.
=============================================================================#


the_sum = 0

# Cycle through every number up to 1000, and check if it's a multiple
# Note, it's "multiples of 3 or 5 BELOW 1000"
for i = 1:999
	if i % 3 == 0 || i % 5 == 0
		global the_sum += i
	end
end

println(the_sum)
