%%
% A Pythagorean triplet is a set of three natural numbers, a < b < c, for
% which,
% 		a^2 + b^2 = c^2
% For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
% 
% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.
%%
clear; close all;
tic


for a = 1 : 1000
	for b = 1 : 1000 - a
		c = 1000 - (a + b);
		if a^2 + b^2 == c^2 && a < b
			answer = sprintf('%d*%d*%d = %d', a, b, c, a*b*c);
		end
	end
end

disp(answer)

toc

