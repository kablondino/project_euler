function is_palindrome = check_palindrome( a, b )
	% This function will check whether the given number is palindrome
	if num2str(a*b) == flip(num2str(a*b))
		is_palindrome = true;
	else
		is_palindrome = false;
	end
end

%% An alternate way of checking a palindrome, but MUCH less efficient
%function is_palindrome = check_palindrome( a, b )
%	is_palindrome = true;
%
%	% Convert to string (a vector)
%	forward_integer = num2str(forward_integer);
%
%	% Find number of iterations required to check the number
%	if rem(length(forward_integer), 2) == 0
%		len = length(forward_integer) / 2;
%	else
%		len = (length(forward_integer) - 1) / 2;
%	end
%
%	% Loop through the new string to check if not palindrome
%	for i = 1 : len
%		if forward_integer(i) ~= forward_integer(length(forward_integer) ...
%				+ 1 - i)
%			is_palindrome = false;
%			break;
%		end
%	end
