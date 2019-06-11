%%
% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
% that the 6th prime is 13.
%
% What is the 10,001st (ten-thousand first) prime number?
%%
clc; clear; close all;


counter = 1;
target = uint64(3);

while counter < 10001
	if check_prime(target) == true
		counter = counter + 1;
	end
	target = target + 2;
end

target = target - 2;  % Eliminate the last increment of 2 from the last loop

answer = sprintf('The %d prime number is %d', counter, target);
disp(answer)

