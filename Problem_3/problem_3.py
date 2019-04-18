"""
	Problem 3
	The prime factors of 13195 are 5, 7, 13 and 29.

	What is the largest prime factor of the number 600851475143 ?
"""


the_target = 600851475143
current = the_target

i = 3

while True:
	while( not (current % i) ):
		current /= i
		high = i
	
	if( current == 1 ):
		break

	i += 2

print("Largest prime factor of %d is %d" % (the_target, high))

