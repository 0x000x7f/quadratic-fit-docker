subroutine quadratic_fit(x, y, n, coeffs)
  implicit none
  integer, intent(in) :: n
  real(8), intent(in) :: x(n), y(n)
  real(8), intent(out) :: coeffs(3)

  real(8) :: xtx(3,3), xty(3)
  real(8) :: X(n,3)
  integer :: i, j, k
  real(8) :: work(3,3)
  real(8) :: b(3)

  do i = 1, n
    X(i,1) = x(i)**2
    X(i,2) = x(i)
    X(i,3) = 1.0d0
  end do

  do i = 1, 3
    do j = 1, 3
      xtx(i,j) = 0.0d0
      do k = 1, n
        xtx(i,j) = xtx(i,j) + X(k,i) * X(k,j)
      end do
    end do
  end do

  do i = 1, 3
    xty(i) = 0.0d0
    do k = 1, n
      xty(i) = xty(i) + X(k,i) * y(k)
    end do
  end do

  work = xtx
  b = xty

  do i = 1, 3
    do j = i+1, 3
      if (abs(work(i,i)) < 1.0d-12) stop "Singular matrix"
      b(j) = b(j) - work(j,i)/work(i,i)*b(i)
      do k = i, 3
        work(j,k) = work(j,k) - work(j,i)/work(i,i)*work(i,k)
      end do
    end do
  end do

  do i = 3, 1, -1
    coeffs(i) = b(i)
    do j = i+1, 3
      coeffs(i) = coeffs(i) - work(i,j) * coeffs(j)
    end do
    coeffs(i) = coeffs(i) / work(i,i)
  end do
end subroutine quadratic_fit
