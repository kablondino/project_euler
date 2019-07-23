#=============================================================================
	Problem 5: Smallest multiple

	2520 is the smallest number that can be divided by each of the numbers from
	1 to 10 without any remainder.

	What is the smallest positive number that is evenly divisible by all of the
	numbers from 1 to 20?
=============================================================================#


function Eratosthenes_Sieve(limit)
	prime_list = Array{Int}(undef, 0)

	prime_check = [true for i = 1:limit]

	p = 2
	while p^2 <= limit
		if prime_check[p] == true
			for i = p^2 : p : limit
				prime_check[i] = false
			end
		end
		p += 1
	end

	for p = 2:limit
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

	####### Not finished
end


println(Eratosthenes_Sieve(100))
