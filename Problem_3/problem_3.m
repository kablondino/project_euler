%%
% Problem 3
% The prime factors of 13195 are 5, 7, 13 and 29.
%
% What is the largest prime factor of the number 600851475143 ?
%%
clear; close all;
tic


the_target = 600851475143;
current = the_target;

% Divisor
i = 3;

while true
	while mod(current, i) == 0 
		current = current / i;
		high = i;
	end
	
	if( current == 1 )
		break
	end

	i = i + 2;
end

fprintf('Largest prime factor of %d is %d\n', the_target, high);

toc

