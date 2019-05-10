"""
    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?
"""

import math


def primes( limit ):
    """
    Args:
        limit: upper limit in list of primes
    Returns:
        primes: list of prime numbers up to, but excluding the limit
    """

    primes = [2]
    for number in range(3, limit, 2):
        if all(number % i != 0 for i in
                range(3, int(math.sqrt(number)) + 1, 2)):
            primes.append(number)

    return primes


def prime_factorization( target ):
    # Generate list up to target
    possible_primes = primes(int(math.sqrt(target)))

    # Create list of zeros of same length as primes list
    zeros = [0 for i in range(len(possible_primes))]
    # Initialize dictionary with zero values
    prime_dict = dict(zip(possible_primes, zeros))  # Initialize with 0

    while target % 2 == 0:
        prime_dict[2] += 1
        target = target / 2

    for i in range(3, int(target**0.5) + 1, 2):
        while target % i == 0:
            prime_dict[i] += 1
            target = target / i

    # If the target is prime, add it to the list
    if target not in possible_primes and target > 2:
        prime_dict = {target: 1}

    return {x:y for x,y in prime_dict.items() if y != 0}


print(prime_factorization(100))

