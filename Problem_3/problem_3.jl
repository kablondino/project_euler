#=
    Problem 3: Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?
=#


the_target = 600851475143
current = the_target

i = 3

while true
	while current % i == 0
		global current /= i
		global high = i
	end

	if current == 1
		break
	end

	global i += 2
end

println("Largest prime factor of $the_target is $high")
