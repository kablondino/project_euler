!-----------------------------------------------------------------------------
! Problem 3
! The prime factors of 13195 are 5, 7, 13 and 29.
!
! What is the largest prime factor of the number 600851475143 ?
!-----------------------------------------------------------------------------

program problem3
    implicit none
    integer, parameter :: i16 = selected_int_kind(16)
    integer(kind=i16), parameter :: the_target = 600851475143_i16
    integer*16 :: current
    integer :: i, high

    current = the_target

    i = 3
    high = 0

    do while( .true. )
        do while ( mod(current, i) .eq. 0 )
            current = current / i
            high = i
        enddo

        if( current .eq. 1 ) then
            exit
        endif

        i = i + 2
    enddo

    print'(a, I0, a, I0)', "Largest prime factor of ", the_target, " is ", high

end program

