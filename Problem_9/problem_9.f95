!
! A Pythagorean triplet is a set of three natural numbers, a < b < c, for
! which,
! 		a^2 + b^2 = c^2
! For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
! 
! There exists exactly one Pythagorean triplet for which a + b + c = 1000.
! Find the product abc.
!

PROGRAM problem_9
    implicit none
    integer :: a, b, c

    do a = 1, 1000
        do b = 1, 1000 - a
            c = 1000 - (a + b)
            if(a**2 + b**2 == c**2 .and. a < b) then
                write(*, '(i0,a,i0,a,i0,a,i0)') a, "*", b, "*", c, " = ", a*b*c
            endif
        enddo
    enddo

END PROGRAM problem_9

