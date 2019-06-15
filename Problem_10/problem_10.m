%%
% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
%
% Find the sum of all the primes below two million.
%%
clear; close all;


limit = 2000000;

% Initialize the entire boolean sieve to true
% `.false.` means composite (not prime)
the_sieve = true(1, limit);

% The method for going up by increments of `p` is slow in Matlab/Octave.
% Instead, set the composite multiples directly (easier to write).
for n = 2 : sqrt(limit)
	if the_sieve(n) == true
		the_sieve(n*n : n : limit) = false;
	end
end

% Sum the indices of the `the_sieve` array that are still .true.
the_sum = 0;
for j = 2 : limit
	if the_sieve(j) == true
		the_sum = the_sum + j;
	end
end

format long
fprintf('%d\n', the_sum)

