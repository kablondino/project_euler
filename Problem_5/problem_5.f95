!
! 2520 is the smallest number that can be divided by each of the numbers from
! 1 to 10 without any remainder.
! What is the smallest positive number that is evenly divisible by all of the
! numbers from 1 to 20?
!

FUNCTION greatest_common_denominator( m, n )
    implicit none
    integer*16 greatest_common_denominator
    integer*16 m, n

    do while(m .ne. n)
        if( m > n ) then
            m = m - n
        else
            n = n - m
        endif
    enddo

END FUNCTION greatest_common_denominator


FUNCTION least_common_multiple( a, b )
    implicit none
    integer*16 greatest_common_denominator, least_common_multiple
    integer*16 a, b, this_gcd

    this_gcd = greatest_common_denominator( a, b )
    least_common_multiple = a*b / this_gcd

END FUNCTION least_common_multiple


PROGRAM problem_5
    implicit none
    integer*16 x, i
    integer*16 greatest_common_denominator, least_common_multiple

    do i = 2, 20
        x = least_common_multiple(x, i)
    enddo

    print*, x

END PROGRAM problem_5


