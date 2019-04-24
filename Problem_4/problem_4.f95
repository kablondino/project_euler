!
! A palindromic number reads the same both ways. The largest palindrome made
! from the product of two 2-digit numbers is 9009 = 91 × 99.
!
! Find the largest palindrome made from the product of two 3-digit numbers.
!

integer*8 function reverse_integer( forward_integer )
    implicit none
    integer*8, intent(in) :: forward_integer
    integer*8 :: reversed
    integer*8 :: modify_integer
    integer*8 :: remainder = 0

    modify_integer = forward_integer
    print*, "2nd: modify_integer", modify_integer, "remainder: ", remainder, &
        "reversed: ", reversed, "reverse_integer:", reverse_integer

    do while( modify_integer .ne. 0 )
        remainder = mod(modify_integer, 10)
        reversed = reversed*10 + remainder
        modify_integer = modify_integer / 10
    enddo

    print*, "2nd: modify_integer", modify_integer, "remainder: ", remainder, &
        "reversed: ", reversed, "reverse_integer:", reverse_integer

    reverse_integer = reversed

end function reverse_integer


program problem_4
    implicit none
    integer*8 :: reverse_integer  ! Initialize function call
    integer*8 :: reversed
    integer*8 :: max_palindrome = 0
    integer*8 :: final_i = 0
    integer*8 :: final_j = 0

    ! Loop counters
    integer*8 :: i,j
    ! Solution
    integer*8 :: answer, reversed_answer

!    i = 994
!    j = 913
!    answer = i*j
!    reversed_answer = reverse_integer(i*j)
!    print*, i, j, i*j, answer, reverse_integer(i*j), reverse_integer(answer), &
!        reversed_answer
!    if( i*j == reversed_answer ) then
!        print*, "It's true!"
!    else
!        print*, "It's false..."
!    endif

    do i = 9, 1, -1
        do j = i, 1, -1
!            print*, i,j, i*j, reverse_integer(i*j), i*j == reverse_integer(i*j)
            reversed_answer = reverse_integer(i*j)
           ! print*, i,j, i*j, reversed_answer
            if( i*j == reversed_answer .and. max_palindrome <= i*j ) then
                final_i = i
                final_j = j
                max_palindrome = i*j
            endif
            reversed_answer = 0
        enddo
    enddo

    write(*, '(I0, A, I0, A, I0)') final_i, " * ", final_j, " = ", &
        max_palindrome
end program problem_4

