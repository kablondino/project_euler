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
        prime_list: list of prime numbers up to half of the limit
    """

    prime_list = []

    for val in range(1, limit + 1):
        if val > 1:
            for n in range(2, val):
                if val % n == 0:
                    break
            else:
                prime_list.append(val)

    return prime_list


def prime_factorization( target ):
    """
    Args:
        target:
    Returns:
        prime_dict that has key/value pairs with value of 0 eliminated
    """

    prime_dict = {}  # Initialize and reset

    if target <= 1:
        return { 1 : 1 }
    # Generate list up to target
    possible_primes = primes(target)

    # Create list of zeros of same length as primes list
    zeros = [0 for i in range(len(possible_primes))]
    # Initialize dictionary with zero values
    prime_dict = dict(zip(possible_primes, zeros))

    # If target is even, take out all the 2's
    while target % 2 == 0:
        prime_dict[2] += 1
        target = target / 2

    for i in range(3, int(target) + 1, 2):
        while target % i == 0:
            prime_dict[i] += 1
            target = target / i

    # If the target is prime, add it to the list
    if target not in possible_primes and target > 2:
        prime_dict = {target: 1}

    return {x:y for x,y in prime_dict.items() if y != 0}


if __name__ == '__main__':
    running_product = 1  # Initialize answer
    max_factors = []

    for i in range(2, 21):
        print(prime_factorization(i))

#        running_product *= max(sorted(prime_factorization(i), reverse=True)[0])

#    print(running_product)

