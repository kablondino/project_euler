"""
    Problem 7: 10001st prime

    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.

    What is the 10,001st (ten-thousand first) prime number?
"""


def is_prime(number):
    # Exit out for negative numbers, 0, 1, and non-integers
    if number <= 1:
        return False

    # Check for even numbers
    if number == 2:
        return True
    elif number % 2 == 0:
        return False

    # Initialize and loop for odd numbers
    i = 3
    while i <= int(number**0.5):
        if number % i == 0:
            return False
        i += 1

    # If it went through all of the conditions, it must be prime
    return True


if __name__ == '__main__':
    # Initialize the looping counter and the intended answer
    counter, target = 1, 3

    while counter < 10001:
        if is_prime(target):
            counter += 1
        target += 2  # Increment to the next odd number

    target -= 2  # Eliminate the last increment of 2 from the last loop

    print("The {0:d} prime number is {1:d}".format(counter, target))
