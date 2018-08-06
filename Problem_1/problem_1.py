"""
	Problem 1: Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3
	or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.
"""

n = 1000
the_numbers = []
for i in xrange(1,n):
	if i % 3 == 0 and i % 5 != 0:
		the_numbers.append(i)
	if i % 5 == 0 and i % 3 != 0:
		the_numbers.append(i)
	if i % 5 == 0 and i % 3 == 0:
		the_numbers.append(i)

the_sum = 0
for j in range(len(the_numbers)):
	the_sum = the_sum + the_numbers[j]

print the_sum

