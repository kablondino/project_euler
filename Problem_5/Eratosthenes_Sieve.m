function prime_list = Eratosthenes_Sieve(limit)
	prime_list = [];
	prime_check = true([1, limit]);
	p = 2;

	while p^2 <= limit
		if prime_check(p) == true
			for i = p^2 : p : limit
				prime_check(i) = 0;
			end
		end
		p = p + 1;
	end

	for p = 2 : limit
		if prime_check(p) == true;
			prime_list = [prime_list, p];
		end
	end

	return;
end

