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
		is_prime = false;
		break;
	end

	if number == 2
		is_prime = true; break;
	else if mod(number, 2) == 0
		is_prime = false; break;
	end

	i = 3;
	while i < int(number^0.5) + 1
		if mod(number, i) == 0
			is_prime = false; break;
		end
		i = i + 1;
	end

	% If it went through all of the conditions, it must be prime
	is_prime = true;
	disp('HELLO! func')
end


disp('HELLO! premain')
counter = 1;
target = 3;

while counter < 10001
	if is_prime(target) == true
		counter = counter + 1;
	end
	target = target + 2;
end

target -= 2;  % Eliminate the last increment of 2 from the last loop

disp('HELLO! postmain')
sprintf('The %d prime number is %d', counter, target)

