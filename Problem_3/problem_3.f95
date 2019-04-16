!
! Problem 3
! The prime factors of 13195 are 5, 7, 13 and 29.
!
! What is the largest prime factor of the number 600851475143 ?

program problem3
    implicit none
    integer(kind=16) :: the_target = 600851475143

    integer(kind=16) :: current = 600851475143

    integer :: i = 3
    integer :: high = 0

    print *, the_target

    do while (1)
        do while ( (current % i) == 0 )
            current = current / i
            high = i
        enddo

        if( current == 1 )
            exit
        endif

        i = i + 2
    enddo

    print'(a, I, a, I)' "Largest prime factor of ", the_target, "is ", high
end

