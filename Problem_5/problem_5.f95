!
! 2520 is the smallest number that can be divided by each of the numbers from
! 1 to 10 without any remainder.
! What is the smallest positive number that is evenly divisible by all of the
! numbers from 1 to 20?
!

PROGRAM problem_5
    implicit none
    integer*16 i, answer

    answer = 1

    do i = 2, 20
        answer = least_common_multiple(answer, i)
    enddo

    print*, answer


    CONTAINS
        INTEGER*16 FUNCTION greatest_common_denominator( a, b )
            integer*16, intent(in) :: a, b
            integer*16 :: x, y

            ! Copy over input(intent=in) parameters to variables to compute
            x = a
            y = b

            ! Euclid's original GCD algorithm (subtraction-based)
            do while( x .ne. y )
                if( x > y ) then
                    x = x - y
                else
                    y = y - x
                endif
            enddo

            greatest_common_denominator = x

        END FUNCTION greatest_common_denominator


        INTEGER*16 FUNCTION least_common_multiple( a, b )
            integer*16, intent(in) :: a, b

            least_common_multiple = ((a*b) / greatest_common_denominator(a, b))

        END FUNCTION least_common_multiple


END PROGRAM problem_5

