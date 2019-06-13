!-----------------------------------------------------------------------------
! The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
!
! Find the sum of all the primes below two million.
!-----------------------------------------------------------------------------

PROGRAM problem_10
    implicit none
    integer, parameter :: limit = 2000000
    integer*16 :: i, j, k, the_sum
    logical, dimension(2:limit) :: the_sieve

    ! Initialize the entire boolean sieve to false
    the_sieve = .false.

    ! Mark all of the even numbers past 2 as not prime
    ! `.true.` means composite (not prime)
    do i = 4, limit, 2
        the_sieve(i) = .true.
    enddo

    ! Cross off the remaining odd composites
    do i = 3, NINT(sqrt(real(limit))), 2
        if( the_sieve(i) .eqv. .false. ) then
            do j = i*i, limit, 2*i
                the_sieve(j) = .true.
            enddo
        endif
    enddo

    ! Sum the indices of the `the_sieve` array that are still .false.
    the_sum = 0
    do k = 2, limit
        if( the_sieve(k) .eqv. .false. ) then
            the_sum = the_sum + k
        endif
    enddo

    print*, the_sum

END PROGRAM problem_10

