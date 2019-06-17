%%
% Problem 4: Largest palindrome product
%
% A palindromic number reads the same both ways. The largest palindrome made
% from the product of two 2-digit numbers is 9009 = 91 × 99.
%
% Find the largest palindrome made from the product of two 3-digit numbers.
%%
clear; close all;
tic


max_palindrome = 0; final_i = 0; final_j = 0;

for i = 999 : -1 : 100
	% Any palindrome MUST be divisible by 11, so the inner loop can go in
	% steps of 11, which is much more efficient.
	j = 990;
	while j > 100
		% The `num2str` function is VERY slow, so the split conditionals are
		% here to vastly speed up the code.
		product = i*j;
		if product > max_palindrome
			product = num2str(product);
			if (product == flip(product))
				max_palindrome = i*j;
				final_i = i; final_j = j;
			end
		end
		j = j - 11;
	end
end

fprintf('%d * %d = %d\n', final_i, final_j, max_palindrome)

toc

