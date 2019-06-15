%%
% 2520 is the smallest number that can be divided by each of the numbers from
% 1 to 10 without any remainder.
%
% What is the smallest positive number that is evenly divisible by all of the
% numbers from 1 to 20?
%%
clear; close all;


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

fprintf('%d\n', answer)

