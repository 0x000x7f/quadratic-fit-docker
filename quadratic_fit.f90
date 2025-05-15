subroutine quadratic_fit(x, y, n, coeffs)
  implicit none
  integer, intent(in) :: n
  real(8), intent(in) :: x(n), y(n)
  real(8), intent(out) :: coeffs(3)

  real(8) :: Xmat(n,3)
  real(8) :: xtx(3,3), xty(3)
  integer :: i, j, k

  ! 行列Xmatの構築
  do i = 1, n
    Xmat(i,1) = x(i)**2
    Xmat(i,2) = x(i)
    Xmat(i,3) = 1.0d0
  end do

  ! X^T X の計算
  do i = 1, 3
    do j = 1, 3
      xtx(i,j) = 0.0d0
      do k = 1, n
        xtx(i,j) = xtx(i,j) + Xmat(k,i) * Xmat(k,j)
      end do
    end do
  end do

  ! X^T y の計算
  do i = 1, 3
    xty(i) = 0.0d0
    do k = 1, n
      xty(i) = xty(i) + Xmat(k,i) * y(k)
    end do
  end do

  ! 解法部分は外部から呼び出すか、後で実装

end subroutine quadratic_fit
