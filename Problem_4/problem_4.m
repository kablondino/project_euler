%%
% A palindromic number reads the same both ways. The largest palindrome made
% from the product of two 2-digit numbers is 9009 = 91 × 99.
%
% Find the largest palindrome made from the product of two 3-digit numbers.
%%
clc
clear

max_palindrome = 0; final_i = 0; final_j = 0;

for i = 999 : -1 : 100
	for j = 999 : -1 : 100
		if check_palindrome(i*j) && max_palindrome < i*j
			max_palindrome = i*j;
			final_i = i; final_j = j;
		end
	end
end

sprintf( '%d * %d = %d', final_i, final_j, max_palindrome )


function is_palindrome = check_palindrome( forward_integer )
	% This function will check whether the given number is palindrome
	is_palindrome = true;

	% Convert to string (a vector)
	forward_integer = num2str(forward_integer);

	% Find number of iterations required to check the number
	if rem(length(forward_integer), 2) == 0
		len = length(forward_integer) / 2;
	else
		len = (length(forward_integer) - 1) / 2;
	end

	% Loop through the new string to check if not palindrome
	for i = 1 : len
		if forward_integer(i) ~= forward_integer(length(forward_integer) ...
				+ 1 - i)
			is_palindrome = false;
			break;
		end
	end
end

