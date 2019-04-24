"""
    A palindromic number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.
"""

# Function to check if product is palindrome
def is_palindrome(a, b):
    # Convert the product to a string, and check if it is itself backwards
    if str(a*b) == str(a*b)[::-1]:
        return True
    else:
        return False

# Store all palindromes of this problem in one dictionary, with the keys being
# a tuple of the factors and the values being the palindrome
list_palindrome = {}

# Start from 999, and loop downwards to find palindrome
for i in range( 999, 100, -1 ):
    for j in range( i, 100, -1 ):
        if is_palindrome(i, j) is True:
            list_palindrome[(i,j)] = i*j  # Populate the dictionary

# Set some convenience variables to aid in printing the answer
first_factor = max(list_palindrome, key=list_palindrome.get)[0]
second_factor = max(list_palindrome, key=list_palindrome.get)[1]

largest_palindrome = list_palindrome[max(list_palindrome,
    key=list_palindrome.get)]

print(first_factor, "*", second_factor, "=", largest_palindrome)
