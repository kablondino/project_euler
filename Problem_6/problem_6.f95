!
! The sum of the squares of the first ten natural numbers is,
!       1^2 + 2^2 + ... + 10^2 = 385
! The square of the sum of the first ten natural numbers is,
!       (1 + 2 + ... + 10)^2 = 55^2 = 3025
! Hence the difference between the sum of the squares of the first ten natural
! numbers and the square of the sum is 3025 − 385 = 2640.
!
! Find the difference between the sum of the squares of the first one hundred
! natural numbers and the square of the sum.

PROGRAM square_sum
    implicit none
    integer :: sum_of_squares
    integer :: square_of_sum
    ! Loop counter
    integer :: i

    sum_of_squares = 0
    square_of_sum = 0

    do i = 1, 100, 1
        sum_of_squares = sum_of_squares + i**2
        square_of_sum = square_of_sum + i
    enddo

    square_of_sum = square_of_sum**2

    ! Print out answers
    write(*, '(a, i0, /, a, i0, /, a, i0)') "Sum of squares: ", &
        sum_of_squares, "Square of sum: ", square_of_sum, "Difference: ", &
        square_of_sum - sum_of_squares

END PROGRAM square_sum

