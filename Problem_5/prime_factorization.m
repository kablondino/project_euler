function prime_factors_dict = prime_factorization(target)
	prime_factors_dict = containers.Map;

	if target <= 1
		prime_factors_dict = containers.Map(1, 1);
		return;
	end

	% Generate the primes up to the target and make a Map (like Python dict)
	% with the primes as keys and the multiplicity as the values
	possible_primes = Eratosthenes_Sieve(target);
	prime_factors_dict = containers.Map(possible_primes, ...
			zeros(size(possible_primes)));

	% Find the factors.
	% If the target is even, take out all the 2's and count them
	while mod(target, 2) == 0
		prime_factors_dict(2) = prime_factors_dict(2) + 1;
		target = target / 2;
	end

    % Loop through odd values from 3 to the target, checking for multiples
	for i = 3 : 2 : target
		while mod(target, i) == 0
			prime_factors_dict(i) = prime_factors_dict(i) + 1;
			target = target / i;
		end
	end

	% If the remaining number is prime, add it to the list
	if isKey(prime_factors_dict, target) && target > 2
		prime_factors_dict(target) = 1;
	end

	% Remove key-value pairs with multiplicities of zero
	primes = cell2mat(keys(prime_factors_dict));
	multiplicity = cell2mat(values(prime_factors_dict));
	for j = primes
		if prime_factors_dict(j) == 0
			remove(prime_factors_dict, j);
		end
	end

	return;
end

