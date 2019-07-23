#=
	Problem 2: Even Fibonacci numbers

	Each new term in the Fibonacci sequence is generated by adding the
	previous two terms. By starting with 1 and 2, the first 10 terms will be:
			1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

	By considering the terms in the Fibonacci sequence whose values do
	not exceed four million, find the sum of the even-valued terms.
=#


function F(AN)
	# Calculates the AN-th Fibonacci number
	if AN <= 0
		return 0
	elseif AN == 1
		return 1
	else
		return round(Int, ((1 + sqrt(5))^AN - (1 - sqrt(5))^AN) / (2^AN * sqrt(5)))
	end
end


the_sum, i = 0, 2

while F(i) <= 4.0e6
	if F(i) % 2 == 0
		global the_sum += F(i)
	end
	global i += 1
end

println("The sum of the even-valued terms of the Fibonacci sequence up to 4 million is $the_sum")
