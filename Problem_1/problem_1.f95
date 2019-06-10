!-----------------------------------------------------------------------------
! Problem 1: Multiples of 3 and 5
!
! If we list all the natural numbers below 10 that are multiples of 3
! or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
!
! Find the sum of all the multiples of 3 or 5 below 1000.
!-----------------------------------------------------------------------------

program problem1
    implicit none
    integer :: i, the_sum

    the_sum = 0

    ! Cycle through every number up to 1000, and check if it's a multiple
    ! Note, it's "multiples of 3 or 5 BELOW 1000"
    do i = 0, 999
        if ( mod( i, 3 ) .eq. 0 .or. mod( i, 5 ) .eq. 0 ) THEN
            the_sum = the_sum + i
        endif
    enddo

    print *, the_sum
end program problem1

