"""
    Problem 5: Smallest multiple

    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.

    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?
"""

from collections import Counter


def primes_upto(limit):
    """
    THIS FUNCTION IS DEPRICATED and slow. Use `Eratosthenes_Sieve`

    Args:
        limit: upper limit in list of primes
    Returns:
        prime_list: list of prime numbers
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


def Eratosthenes_Sieve(limit):
    """
    Args:
        limit: upper limit in list of primes
    Returns:
        prime_list: list of prime numbers, using the algorithm by Eratosthenes
        https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
    """
    prime_list = []

    # Boolean list in which the position represents is_prime. Initialize to
    # everything is True (a prime)
    prime_check = [True for i in range(limit + 1)]

    # Incremental sieve in which the multiples of each prime `p` are generated
    # by counting up from the square of the prime in increments of `p`
    p = 2
    while p**2 <= limit:
        if prime_check[p] is True:
            # Update all multiples of p up to the limit to not prime
            for i in range(p**2, limit + 1, p):
                prime_check[i] = False
        p += 1

    # Populate the returned prime_list
    for p in range(2, limit + 1):
        if prime_check[p]:
            prime_list.append(p)

    return prime_list


def prime_factorization(target):
    """
    Args:
        target: the number that will be broken down into prime factors
    Returns:
        prime_factors_dict: dict of each prime value and its multiplicity
    """

    prime_factors_dict = {}  # Initialize and reset

    # Default dictionary less than or equal to one
    if target <= 1:
        return {1: 1}

    # Generate list of primes up to target
    possible_primes = Eratosthenes_Sieve(target)
    # Create list of zeros of same length as primes list
    zeros = [0 for i in range(len(possible_primes))]

    # Initialize dictionary with zero values
    prime_factors_dict = dict(zip(possible_primes, zeros))

    # Do the finding of the factors
    # If target is even, take out all the 2's and count them up
    while target % 2 == 0:
        prime_factors_dict[2] += 1
        target = target / 2

    # Loop through odd values from 3 to the target, checking for multiples
    for i in range(3, int(target) + 1, 2):
        while target % i == 0:
            prime_factors_dict[i] += 1
            target = target / i

    # If the remaining number is prime, add it to the list
    if target not in possible_primes and target > 2:
        prime_factors_dict = {target: 1}

    # Cut out the keys with value of zero, just for simplicity
    return {x: y for x, y in prime_factors_dict.items() if y != 0}


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
