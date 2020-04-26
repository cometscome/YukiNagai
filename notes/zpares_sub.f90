!--------------------------------------------
! This is the sample code for z-Pares
!                      Yuki Nagai, Ph.D
!                      03/09/2014 (dd/mm/yyyy)
!--------------------------------------------
module zpares_sub
contains
  subroutine zpares_zdnsgegv_sub(UPLO,A,LDA,emin, emax, num_ev, eigval, X, res,L,N,M,LMAX)
    use zpares
    implicit none
    character(1),intent(in)::UPLO
    integer,intent(in)::LDA
    complex(8),intent(in)::A(1:LDA,1:LDA)
    real(8),intent(in)::emin,emax
    integer,intent(out)::num_ev
    real(8),allocatable,intent(out)::eigval(:),res(:)
    complex(8),allocatable::X(:,:)
    integer,optional::L,N,M,LMAX
    !local variables
    type(zpares_prm) :: prm
    integer::i,j,ncv,info
    complex(8)::B(1:LDA,1:LDA)
    B = 0d0
    do i = 1,LDA
       B(i,i) = 1d0
    end do
    
    call zpares_init(prm)
    
    if ( present(L) ) then
       prm%L = L
    else 
       prm%L = 8
    end if
    if ( present(N) ) then
       prm%N = N
    else 
       prm%N = 32
    end if
    if ( present(M) ) then
       prm%M = M
    else 
       prm%M = 16
    end if
    if ( present(Lmax) ) then
       prm%Lmax = Lmax
    else 
       prm%Lmax = 32
    end if
    
    ncv = zpares_get_ncv(prm)
    allocate(eigval(ncv), X(LDA, ncv), res(ncv))
    
    call zpares_zdnshegv(prm, UPLO, LDA, A, LDA, B, LDA, emin, emax, num_ev, eigval, X, res, info)  
    if(info .ne.0) then
       write(*,*) "error. info = ",info
       stop
    end if
    
    call zpares_finalize(prm)

    
    return
  end subroutine zpares_zdnsgegv_sub
end module zpares_sub

program main
  use zpares_sub
  implicit none
  complex(8),allocatable::A(:,:)
  integer::LDA,num_ev
  real(8)::emin,emax
  real(8), allocatable :: res(:), eigval(:)
  complex(8), allocatable :: X(:,:)
  integer::i

  LDA = 500
  
  allocate(A(1:LDA,1:LDA))
  call make_matrix(A,LDA)

  emin = 1.49d0
  emax = 2.01d0
  
  call zpares_zdnsgegv_sub('L',A,LDA,emin, emax, num_ev, eigval, X, res)

  do i = 1, num_ev
     write(*,*) i, eigval(i), res(i)
  end do

end program main

subroutine make_matrix(A,LDA)
  implicit none
  integer,intent(in)::LDA
  complex(8),intent(out)::A(1:LDA,1:LDA)
  !local variables
  integer::i,j
  
  A = (0d0,0d0)
  do i = 1, LDA
     do j = 1, LDA
        if ( i == j ) then
           A(i,j) = (2d0,0d0)
        else if ( abs(i-j) == 1 ) then
           A(i,j) = (1d0,0d0)
        end if
     end do
  end do
  
  return
end subroutine make_matrix

