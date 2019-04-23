%
% Problem 1: Multiples of 3 and 5
%
% If we list all the natural numbers below 10 that are multiples of 3
% or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%
% Find the sum of all the multiples of 3 or 5 below 1000.
%


s3 = 0;
s5 = 0;
s15 = 0;

for j = 0:1000
	if mod(j, 3) == 0
        s3 = s3 + j;
    elseif mod(j, 5) == 0
        s5 = s5 + j;
    elseif mod(j, 15) == 0
        s15 = s15 + j;
    end
end

disp( s3 + s5 - s15 )

