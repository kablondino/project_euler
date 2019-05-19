%%
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
% that the 6th prime is 13.
%
% What is the 10,001st (ten-thousand first) prime number?
%%
clc
clear

function is_prime = check_prime( number )
	% Checks if the input number is prime
	if number <= 1
		return False
	end

	if number == 2
		return True
	else if mod(number, 2) == 0
		return False
	end

	i = 3;
	while i < int(number^0.5) + 1
		if mod(number, i) == 0
			return False
		i = i + 1;

	% If it went through all of the conditions, it must be prime
	return True
end


counter = 1;
target = 3;

while counter < 10001
	if is_prime(target) is True
		counter = counter + 1;
	target = target + 2;

target -= 2;  % Eliminate the last increment of 2 from the last loop

sprintf('The %d prime number is %d', counter, target)

