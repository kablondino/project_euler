function is_prime = check_prime( number )
	% Checks if the input number is prime
	if number <= 1 || ~isa(number, 'integer')
		is_prime = false;
		return;
	end

	if number == uint64(2)
		is_prime = true;
		return;
	else if mod(number, 2) == 0
		is_prime = false;
		return;
	end

	i = uint64(3);
	while i < uint64(floor(sqrt(double(number)))) + 1
		if mod(number, i) == 0
			is_prime = false;
			return;
			%break;
		end
		i = i + 1;
	end

	% If it went through all of the conditions, it must be prime
	is_prime = true;
	return;
    end
end

