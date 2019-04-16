"""
    Problem 2: Even Fibonacci Numbers
    Each new term in the Fibonacci sequence is generated by adding the
    previous two terms. By starting with 1 and 2, the first 10 terms will be:
            1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

    By considering the terms in the Fibonacci sequence whose values do
    not exceed four million, find the sum of the even-valued terms.
"""

import math

def F( AN ):
    if AN <= 0: return 0
    elif AN == 1: return 1
    else: return int( ((1 + math.sqrt(5))**AN - (1 - math.sqrt(5))**AN)\
        / (2**AN * math.sqrt(5)) )

the_sum, i = 0, 2

while F(i) <= 4.0e6:
    if F(i) % 2 == 0:
            the_sum = the_sum + F(i)
    i = i + 1

print(the_sum)

