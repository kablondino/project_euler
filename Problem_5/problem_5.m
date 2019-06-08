%%
% 2520 is the smallest number that can be divided by each of the numbers from
% 1 to 10 without any remainder.
%
% What is the smallest positive number that is evenly divisible by all of the
% numbers from 1 to 20?
%%
clc; clear; close all;




function prime_list = Eratosthenes_Sieve(limit)
	prime_list = [];
	prime_check = true([1, limit]);
	p = 2;

	while p^2 <= limit
		if prime_check(p) == true
			for i = p^2 : p : limit
				prime_check(i) = 0;
			end
		end
		p = p + 1;
	end

	for p = 2 : limit
		if prime_check(p) == true;
			prime_list = [prime_list, p];
		end
	end

	return;
end


function prime_factors_dict = prime_factorization(target)

	if target <= 1
		prime_factors_dict = containers.Map(1, 1);
		return;
	end

	possible_primes = Eratosthenes_Sieve(target);
	zeros(size(possible_primes))
	prime_factors_dict = containers.Map(possible_primes, zeros(size(possible_primes)));

	% Find the factors.
	% If the target is even, take out all the 2's and count them
	while mod(target, 2) == 0
		prime_factors_dict(2) = prime_factors_dict(2) + 1;
		target = target / 2;
	end

    % Loop through odd values from 3 to the target, checking for multiples
	for i = 3 : target : 2
		while mod(target, i) == 0
			prime_factors_dict(i) = prime_factors_dict(i) + 1;
			target = target / i;
		end
	end

	% If the remaining number is prime, add it to the list
	if ~isKey(prime_factors_dict, target)
		prime_factors_dict(target) = 1;
	end

	return;
end
