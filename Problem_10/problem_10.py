"""
    Problem 10: Summation of primes

    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    Find the sum of all the primes below two million.
"""

import sys
sys.path.insert(0, '../Problem_5')
from problem_5 import Eratosthenes_Sieve as primes_upto

print(sum(primes_upto(int(2e6))))
