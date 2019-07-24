#=============================================================================
    Problem 10: Summation of primes

    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    Find the sum of all the primes below two million.
=============================================================================#


include("../Problem_5/problem_5.jl")
import .Eratosthenes_Sieve

print("$(sum(Eratosthenes_Sieve(Int(2e6))))\n")
