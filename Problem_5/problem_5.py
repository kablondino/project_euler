"""
    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?
"""

from collections import Counter


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
        target: the number that will be broken down into prime factors
    Returns:
        prime_factors_dict: dict of each prime value and its multiplicity
    """

    prime_factors_dict = {}  # Initialize and reset

    # Default dictionary less than or equal to one
    if target <= 1:
        return { 1 : 1 }

    # Generate list of primes up to target
    possible_primes = primes(target)
    # Create list of zeros of same length as primes list
    zeros = [0 for i in range(len(possible_primes))]

    # Initialize dictionary with zero values
    prime_factors_dict = dict(zip(possible_primes, zeros))

    ## Do the finding of the factors
    # If target is even, take out all the 2's
    while target % 2 == 0:
        prime_factors_dict[2] += 1
        target = target / 2

    # If th
    for i in range(3, int(target) + 1, 2):
        while target % i == 0:
            prime_factors_dict[i] += 1
            target = target / i

    # If the remaining number is prime, add it to the list and exit
    if target not in possible_primes and target > 2:
        prime_factors_dict = {target: 1}

    prime_factors_dict
    # Cut out the keys with value of zero, just for simplicity
    return {x:y for x,y in prime_factors_dict.items() if y != 0}


if __name__ == '__main__':
    """ `max_powers_dict` will represent a dictionary with the maximum powers
    of each prime factorization for a particular target. For example, the prime
    factorization of 16 are {2:4} and {2:1, 3:2}, respectively
    The final result of this variable will be {2:4, 3:2} (The result of 2:1
    from the factorization of 18 is thrown out) """
    max_powers_dict = Counter({})

    for i in range(2, 21):
        ith_factorization = prime_factorization(i)
        for j in ith_factorization:
            if ith_factorization[j] > max_powers_dict[j]:
                max_powers_dict[j] = prime_factorization(i)[j]

    answer = 1  # Initialize answer

    # Multiply all of the keys^value of the max_powers_dict
    for k in max_powers_dict:
        answer *= k**max_powers_dict[k]

    print(answer)

