%%
% A palindromic number reads the same both ways. The largest palindrome made
% from the product of two 2-digit numbers is 9009 = 91 × 99.
%
% Find the largest palindrome made from the product of two 3-digit numbers.
%%
clc; clear; close all;


max_palindrome = 0; final_i = 0; final_j = 0;

for i = 999 : -1 : 100
	for j = 999 : -1 : 100
		if check_palindrome(i, j) && max_palindrome < i*j
			max_palindrome = i*j;
			final_i = i; final_j = j;
		end
	end
end

sprintf( '%d * %d = %d', final_i, final_j, max_palindrome )

