#!/bin/bash

#=============================================================================
#	Problem 5: Smallest multiple
#
#	2520 is the smallest number that can be divided by each of the numbers from
#	1 to 10 without any remainder.
#
#	What is the smallest positive number that is evenly divisible by all of the
#	numbers from 1 to 20?
#=============================================================================


function Eratosthenes_Sieve() {
	prime_list=()
	prime_check=()
	# Boolean list in which the position represents is_prime. Initialize to
	# everything is True (a prime)
	for i in $(seq 1 $1); do
		prime_check+=(true)
	done

	# Incremental sieve in which the multiples of each prime `p` are generated
	# by counting up from the square of the prime in increments of `p`
	p=2
	while [ $((p*p)) -le $1 ]; do
		if ${prime_check[p]}; then
			# Update all multiples of p up to the limit to not prime
			for i in $(seq $((p*p)) $1 $p); do
				prime_check[$i]=false
			done
		fi
		p+=1
	done

	for p in $(seq 2 $1); do
		if ${prime_check[$p]}; then
			prime_list+=($p)
		fi
	done
}

Eratosthenes_Sieve 20
declare -p prime_check
declare -p prime_list

