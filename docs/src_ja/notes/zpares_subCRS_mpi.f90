!--------------------------------------------
! This is the sample code for z-Pares
!                      Yuki Nagai, Ph.D
!                      05/09/2014 (dd/mm/yyyy)
!--------------------------------------------

module zpares_subCRS
contains
  subroutine zpares_dmpssygv_sub(LDA, rowA, colA, valA  &
       , emin, emax, num_ev, eigval, X, res, L,N,M,LMAX)
    use zpares
    use zpares_mumps
    implicit none
    include 'mpif.h'
    integer,intent(in)::LDA
    real(8),intent(in) :: emin, emax
    integer,intent(in) :: rowA(:), colA(:)
    real(8),intent(in) :: valA(:)
    real(8),allocatable,intent(out)::res(:), eigval(:), X(:,:)
    integer,allocatable::rowB(:),colB(:)
    real(8),allocatable::valB(:)
    integer,intent(out)::num_ev

    integer,optional::L,N,M,LMAX
!local variables
    integer::ierr,i,info,ncv
    type(zpares_prm) :: prm


    allocate(rowB(LDA+1),colB(LDA),valB(LDA))

    do i = 1, LDA
       rowB(i) = i
       colB(i) = i
       valB(i) = 1d0
    end do
    rowB(LDA+1) = LDA+1


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

    prm%high_comm = MPI_COMM_WORLD
    prm%low_comm = MPI_COMM_SELF


    ncv = zpares_get_ncv(prm)
    allocate(eigval(ncv), X(LDA, ncv), res(ncv))

    call zpares_dmpssygv(prm, LDA, rowA, colA, valA, rowB, colB, valB &
         , emin, emax, num_ev, eigval, X, res, info)  
    call zpares_finalize(prm)



    
    return
  end subroutine zpares_dmpssygv_sub

  subroutine make_crs(LDA,sub_ijv,row,col,val)
    implicit none
    interface 
       subroutine sub_ijv(i,j,v)
         integer,intent(in)::i,j
         real(8),intent(out)::v
       end subroutine sub_ijv
    end interface
    integer,intent(in)::LDA
    integer,allocatable,intent(out)::row(:),col(:)
    real(8),allocatable,intent(out)::val(:)
!local variables
    integer::i,j
    real(8)::vec_temp(1:LDA)
    integer::vec_coltemp(1:LDA)
    integer,allocatable::col_temp(:)
    real(8),allocatable::val_temp(:)
    real(8)::v
    integer::Mi,M
! The matrix must be symmetric

    allocate(row(1:LDA+1))   
    M = 0
    do i = 1,LDA
       vec_temp = 0d0
       Mi = 0
       if(i == 1) then 
          row(i) = 1
       else 
          row(i) = M + 1
       end if
       do j = i,LDA
          call sub_ijv(i,j,v)
          if(v .ne. 0d0) then 
             Mi = Mi + 1
             vec_temp(Mi) = v
             vec_coltemp(Mi) = j
          end if
       end do

       allocate(val_temp(1:M+Mi),col_temp(1:M+Mi))
       if(i .ne. 1) then
          val_temp(1:M) = val(1:M)
          col_temp(1:M) = col(1:M)
          deallocate(val,col)
       end if
       val_temp(M+1:M+Mi) = vec_temp(1:Mi)
       col_temp(M+1:M+Mi) = vec_coltemp(1:Mi)
      
       M = M + Mi
       allocate(val(1:M),col(1:M))
       val = val_temp
       col = col_temp
       deallocate(val_temp,col_temp)

    end do
    row(LDA+1) = M+1
       
    return
  end subroutine make_crs
end module zpares_subCRS


program main
  use zpares_subCRS
  implicit none
  include 'mpif.h'
  integer, parameter :: LDA = 5000
  integer :: num_ev,i
  real(8) :: emin, emax
  integer, allocatable :: rowA(:), colA(:)
  real(8), allocatable :: res(:), eigval(:)
  real(8), allocatable :: valA(:), X(:,:)
  integer::ierr
  external make_matrix
  call MPI_INIT(ierr)

  call make_crs(LDA,make_matrix,rowA,colA,valA)
  emin = 1.49d0
  emax = 2.01d0

  call zpares_dmpssygv_sub(LDA, rowA, colA, valA  &
       , emin, emax, num_ev, eigval, X, res)

  do i = 1, num_ev
     write(*,*) i, eigval(i), res(i)
  end do

  call MPI_FINALIZE(ierr)
end program main

subroutine make_matrix(i,j,v)
  implicit none
  integer,intent(in)::i,j
  real(8),intent(out)::v
  v = 0d0

  if(i ==j) then 
     v = 2d0
  else if(abs(i-j) == 1) then
     v = 1d0
  end if

  return
end subroutine make_matrix
