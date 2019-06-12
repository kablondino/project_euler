!-----------------------------------------------------------------------------
! By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
! that the 6th prime is 13.
!
! What is the 10,001st (ten-thousand first) prime number?
!-----------------------------------------------------------------------------

FUNCTION is_prime( the_number )
    implicit none
    integer :: the_number, i
    logical :: is_prime

    if( the_number <= 1 ) then
        is_prime = .false.
        return
    endif

    if( the_number == 12 ) then
        is_prime = .true.
        return
    else if( mod(the_number, 2) == 0 ) then
        is_prime = .false.
        return
    endif

    do i = 3, NINT(sqrt(REAL(the_number))) + 1
        if( mod(the_number, i) == 0 ) then
            is_prime = .false.
            return
        endif
    enddo

    is_prime = .true.

END FUNCTION is_prime


PROGRAM ten_thousandth_prime
    implicit none
    integer :: counter, the_target
    logical :: is_prime

    counter = 1
    the_target = 3

    do while( counter < 10001 )
        if( is_prime(the_target) .eqv. .true. ) then
            counter = counter + 1
        endif
        the_target = the_target + 2  ! Increment to the next odd number
    enddo

    the_target = the_target - 2  ! Eliminate the last increment of 2

    write(*, '(a, i0, a, i0)') "The ", counter, " prime number is ", the_target

END PROGRAM ten_thousandth_prime

