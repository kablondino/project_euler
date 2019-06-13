%%
% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
%
% Find the sum of all the primes below two million.
%%
clear; close all;


limit = 2000000;

% Initialize the entire boolean sieve to false
the_sieve = true(1,limit);

% Incremental sieve in which the multiples of each prime p are generated
% by counting up from the square of the prime in increments of `p`
%p = 2;
%while p^2 <= limit
%	if the_sieve(p) == true
%		for j = p^2 : p : limit
%			the_sieve(j) = false;
%		end
%	end
%	p = p + 1;
%end
for n = 2 : sqrt(limit)
	if the_sieve(n) == true
		the_sieve(n*n : n : limit) = false;
	end
end

the_sum = 0;
for j = 2 : limit
	if the_sieve(j) == true
		the_sum = the_sum + j;
	end
end

format long
fprintf('%d\n', the_sum)

