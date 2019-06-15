function is_prime = check_prime( number )
	%% THIS FUNCTION IS DEPRICATED. Both Matlab and Octave have the built-in
	% `isprime(x) function, which is much faster.
	% Checks if the input number is prime

	% Exit out for negative numbers, 0, and 1
	if number <= 1 || ~isa(number, 'integer')
		is_prime = false;
		return;
	end

    % Check for even numbers
	if number == uint64(2)
		is_prime = true;
		return;
	else if mod(number, 2) == 0
		is_prime = false;
		return;
	end

    % Initialize and loop for odd numbers
	i = uint64(3);
	sqrt_of_number = uint64(floor(sqrt(double(number))));
	while i <= sqrt_of_number
		if mod(number, i) == 0
			is_prime = false;
			return;
		end
		i = i + 1;
	end

	% If it went through all of the conditions, it must be prime
	is_prime = true;
    end
end

