#=============================================================================
	Problem 5: Smallest multiple

	2520 is the smallest number that can be divided by each of the numbers from
	1 to 10 without any remainder.

	What is the smallest positive number that is evenly divisible by all of the
	numbers from 1 to 20?
=============================================================================#


function Eratosthenes_Sieve(limit)
	prime_list = Array{Int}(undef, 0)

	# Boolean list in which the position represents is_prime. Initialize to
	# everything is True (a prime)
	prime_check = trues(1, limit)

	# Incremental sieve in which the multiples of each prime `p` are generated
	# by counting up from the square of the prime in increments of `p`
	p = 2
	while p^2 <= limit
		if prime_check[p] == true
			# Update all multiples of p up to the limit to not prime
			for i = p^2 : p : limit
				prime_check[i] = false
			end
		end
		p += 1
	end

	# Populate the returned prime_list
	for p = 2 : limit
		if prime_check[p] == true
			push!(prime_list, p)
		end
	end

	return prime_list
end


function prime_factorization(target)
	prime_factors_dict = Dict{Int, Int}()  # Initialize and reset

	# Default dictionary less than or equal to one
	if target <= 1
		prime_factors_dict = (1 => 1)
	end

	# Generate list of primes up to target
	possible_primes = Eratosthenes_Sieve(target)

	# Initialize dictionary with zero values
	prime_factors_dict = Dict(zip(possible_primes,
								  zeros(Int, 1, length(possible_primes))))

	# Do the finding of the factors
	# If target is even, take out all the 2's and count them up
	while target % 2 == 0
		prime_factors_dict[2] += 1
		target /= 2
	end

    # Loop through odd values from 3 to the target, checking for multiples
	for i = 3 : 2 : Int(target)
		while target % i == 0
			prime_factors_dict[i] += 1
			target /= i
		end
	end

	# If the remaining number is prime, add it to the list
	if target > 2 && ~in(target, possible_primes)
		prime_factors_dict = Dict(target => 1)
	end

	return prime_factors_dict
end


#====================== Main program starts here =============================
	`max_powers_dict` will represent a dictionary with the maximum powers
	of each prime factorization for a particular target. For example, the prime
	factorization of 16 and 18 are {2:4} and {2:1, 3:2}, respectively
	The final result of this variable will be {2:4, 3:2} (The result of 2:1
	from the factorization of 18 is thrown out)
=#

max_powers_dict = Dict{Int, Int}()

for i = 2 : 20
	ith_factorization = prime_factorization(i)
	for j in keys(ith_factorization)
#		print("i = $i,\t$ith_factorization,\tj = $j, ith_[j] = $(ith_factorization[j])\n")
		if ith_factorization[j] > get(max_powers_dict, j, 0)
			max_powers_dict[j] = ith_factorization[j]
		end
	end
end

answer = 1  # Initialize answer

# Multiply all of the keys^value of the max_powers_dict
for k in keys(max_powers_dict)
	global answer *= k^(max_powers_dict[k])
end

println(answer)
