!-----------------------------------------------------------------------------
! Problem 10: Summation of primes
!
! The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
!
! Find the sum of all the primes below two million.
!-----------------------------------------------------------------------------

PROGRAM problem_10
    implicit none
    integer, parameter :: limit = 2000000
    integer*16 :: i, j, p, the_sum
    logical, dimension(2:limit) :: the_sieve

    ! Initialize the entire boolean sieve to true
    ! `.false.` means composite (not prime)
    the_sieve = .true.

    ! Incremental sieve in which the multiples of each prime `p` are generated
    ! directly by counting up from the square of the prime in increments of `p`
    p = 2
    do while( p**2 <= limit )
        if( the_sieve(p) .eqv. .true. ) then
            do i = p**2, limit + 1, p
                the_sieve(i) = .false.
            enddo
        endif
        p = p + 1
    enddo

    ! Sum the indices of the `the_sieve` array that are still .true.
    the_sum = 0
    do j = 2, limit
        if( the_sieve(j) .eqv. .true. ) then
            the_sum = the_sum + j
        endif
    enddo

    write(*, '(i0)') the_sum

END PROGRAM problem_10

