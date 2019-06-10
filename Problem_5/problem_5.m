%%
% 2520 is the smallest number that can be divided by each of the numbers from
% 1 to 10 without any remainder.
%
% What is the smallest positive number that is evenly divisible by all of the
% numbers from 1 to 20?
%%
clc; clear; close all;


upper_bound = 20;
% Initialize maximum powers dictionary, with zero multiplicities, but with the
% correct prime number keys
max_powers_dict = containers.Map(Eratosthenes_Sieve(upper_bound), ...
		zeros(size(Eratosthenes_Sieve(upper_bound))));

for i = 2 : upper_bound
	ith_factorization = prime_factorization(i);
	primes = cell2mat(keys(ith_factorization));
	multiplicity = cell2mat(values(ith_factorization));
	for j = primes
		if ith_factorization(j) > max_powers_dict(j)
			max_powers_dict(j) = ith_factorization(j);
		end
	end
end

answer = 1;  % Initialize answer

% Multiply all of the keys^value of the max_powers_dict
for k = cell2mat(keys(max_powers_dict))
	answer = answer * k^(max_powers_dict(k));
end

disp(answer)


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
	if isKey(prime_factors_dict, target) & target > 2
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


%%
% The following was an attempt to write the `prime_factorization` function
% with two lists, one for the primes and the other for the multiplicity. It
% was not worth doing.
%%
%function [prime_factors_keys, prime_factors_values] = prime_factorization(target)
%	if target <= 1
%		prime_factors_keys = [1];
%		prime_factors_values = [1];
%		return;
%	end
%
%	% Generate the primes up to the target and make a Map (like Python dict)
%	% with the primes as keys and the multiplicity as the values
%	prime_factors_keys = Eratosthenes_Sieve(target);
%	prime_factors_values = zeros(size(prime_factors_keys));
%
%    % Do the finding of the factors
%    % If target is even, take out all the 2's and count them up
%	while mod(target, 2) == 0
%		prime_factors_values(1) = prime_factors_values(1) + 1;
%		target = target / 2;
%	end
%
%    % Loop through odd values from 3 to the target, checking for multiples
%	for i = 3 : target : 2
%		while mod(target, i) == 0
%			prime_factors_dict(i) = prime_factors_dict(i) + 1;
%			target = target / i;
%		end
%	end
%
%	% If the remaining number is prime, add it to the list
%	if ~ismember(target, prime_factors_keys) & target > 2
%		prime_factors_keys = [prime_factors_keys target];
%		prime_factors_values = [prime_factors_values 1];
%	end
%
%	% Remove all primes with zero multiplicity
%	for j = 1 : length(prime_factors_keys)
%		if prime_factors_values(j) == 0
%			prime_factors_keys(j) = 0;
%		end
%	end
%	prime_factors_keys(prime_factors_keys == 0) = [];
%	prime_factors_values(prime_factors_values == 0) = [];
%
%	return;
%end

