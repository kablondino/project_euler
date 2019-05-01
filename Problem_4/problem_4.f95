!
! A palindromic number reads the same both ways. The largest palindrome made
! from the product of two 2-digit numbers is 9009 = 91 × 99.
!
! Find the largest palindrome made from the product of two 3-digit numbers.
!

function is_palindrome( forward_integer )
    implicit none
    integer*8 :: forward_integer, i, j
    logical :: is_palindrome
    character(10) :: chars

    ! The integer gets written to chars
    write(chars, '(I10)') forward_integer

    i = 1
    j = 10

    ! Skip over blank spaces in chars
    do while( chars(i:i) == ' ' )
        i = i + 1
    enddo

    do i = i, ((i + 10) / 2)
        if( chars(i:i) .ne. chars(j:j) ) then
            is_palindrome = .false.
            return
        endif

        j = j - 1
    enddo

    ! Default answer
    is_palindrome = .true.

end function is_palindrome


program problem_4
    implicit none
    logical :: is_palindrome
    integer*8 :: i, j, final_i, final_j, max_palindrome

    max_palindrome = 0

    do i = 999, 100, -1
        do j = 999, 100, -1
            if( i*j > max_palindrome .and. is_palindrome(i*j)) then
                max_palindrome = i*j
                final_i = i
                final_j = j
            endif
        enddo
    enddo

    write(*, '(I0, A, I0, A, I0)') final_i, " * ", final_j, " = ", &
        max_palindrome

end program problem_4

