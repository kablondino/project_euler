%%
% Problem 7: 10001st prime
%
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
% that the 6th prime is 13.
%
% What is the 10,001st (ten-thousand first) prime number?
%%
clear; close all;
tic


counter = 1;
target = uint64(3);

while counter < 10001
	% My custom function `check_prime` is slow. Use built-in `isprime`.
	%if check_prime(target) == true
	if isprime(target) == true
		counter = counter + 1;
	end
	target = target + 2;
end

target = target - 2;  % Eliminate the last increment of 2 from the last loop

fprintf('The %d prime number is %d\n', counter, target)

toc

