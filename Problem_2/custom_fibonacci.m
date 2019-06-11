function Fib_number = custom_fibonacci( AN )
	% Produces the n-th Fibonacci number, by using the golden ratio
	if AN <= 0
		Fib_number = 0;
	else if AN == 1
		Fib_number = 1;
	else
		Fib_number = round(((1 + sqrt(5))^AN - (1 - sqrt(5))^AN) ...
			/ (2^AN * sqrt(5)));
	end
	end
end

