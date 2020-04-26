!-------------------------------------------------
! This is the sample code for LOBPCG
!                          Yuki Nagai, Ph. D
!                          10/10/2014 (dd/mm/yyyy)
! This program needs LAPACK
!-------------------------------------------------

module LOBPCG
contains

  subroutine calcLOBPCG(n,sub_Ax,md,x,lam,eps)
    implicit none
    interface 
       subroutine sub_Ax(n,x,Ax)
         integer,intent(in)::n
         real(8),intent(in)::x(1:n)
         real(8),intent(out)::Ax(1:n)
       end subroutine sub_Ax
    end interface
    integer,intent(in)::n,md
    real(8),intent(out)::lam(1:md)
    real(8),intent(out)::x(1:n,1:md)
    real(8),intent(in)::eps
    real(8)::xtemp(1:n,1:md),r(1:n,1:md),p(1:n,1:md)
    real(8)::xhx(1:md,1:md),v(1:3*md,1:3*md)
    real(8)::z(1:n,1:3*md),ztemp(1:n,1:3*md),zhz(1:3*md,1:3*md),zlam(1:3*md),zv(1:3*md,1:3*md)
    real(8)::d
    integer::i,j,ii,jj,ite,itemax,nz
    real(8)::reps(1:md),norm
    
    itemax = 100000*2
!    eps = 1d-6
    
    call random_number(x)
    call gram_real(n,md,x,xtemp)
    
    do ii = 1,md
       call sub_Ax(n,xtemp(1:n,ii),x(1:n,ii)) !x = A xtemp
    end do
        
    xhx = matmul(transpose(xtemp),x)
    call eigensystem_real(xhx,lam,v(1:md,1:md),md)
    
    x = matmul(xtemp,v(1:md,1:md))
    r = 0d0
    do ii = 1,md
       r(1:n,ii) = x(1:n,ii)*lam(ii)
    end do
!    write(*,*) sum(abs(r))
    do ii = 1,md
       call sub_Ax(n,x(1:n,ii),xtemp(1:n,ii)) !xtemp = A x
    end do
    r = xtemp - r
    p = 0d0
    
    loopite: do ite = 1,itemax
       z(1:n,1:md) = x(1:n,1:md)
       z(1:n,1+md:2*md) = r(1:n,1:md)
       z(1:n,1+2*md:3*md) = p(1:n,1:md)
       ztemp = z
!       if(ite == 1 .or. mod(ite,10) ==0) then
!          p = 0d0
       if(ite == 1 ) then
          nz = md*2
       else 
          nz = md*3
       end if
       call gram_real(n,nz,z(1:n,1:nz),ztemp(1:n,1:nz))
       
       do ii = 1,nz
          call sub_Ax(n,ztemp(1:n,ii),z(1:n,ii)) !z = A ztemp
       end do
       zhz(1:nz,1:nz) = matmul(transpose(ztemp(1:n,1:nz)),z(1:n,1:nz))
       call eigensystem_real(zhz(1:nz,1:nz),zlam(1:nz),zv(1:nz,1:nz),nz)

       v = zv(1:nz,1:md)
       lam(1:md) = zlam(1:md)
       x(1:n,1:md) = matmul(ztemp(1:n,1:nz),zv(1:nz,1:md))
       r = 0d0
       do ii = 1,md
          r(1:n,ii) = x(1:n,ii)*lam(ii)
       end do
       do ii = 1,md
          call sub_Ax(n,x(1:n,ii),xtemp(1:n,ii)) !xtemp = A x
       end do
       r = xtemp -r
       do ii = 1,md
          reps(ii) = sqrt(sum(abs(r(1:n,ii))**2))
       end do
       if(eps > maxval(reps)) then
          write(*,*) ite,maxval(reps)
          do ii = 1,md
             norm = sqrt(sum(abs(x(1:n,ii))**2))
             x(1:n,ii) = x(1:n,ii)/norm
          end do
          exit loopite
       end if
       if(mod(ite,1000)==0)           write(*,*) ite,maxval(reps)      
       if(ite == 1) then
          p(1:n,1:md) =matmul(r(1:n,1:md),v(1+md:2*md,1:md))
       else 
          p(1:n,1:md) =matmul(r(1:n,1:md),v(1+md:2*md,1:md))+matmul(p(1:n,1:md),v(1+2*md:3*md,1:md))
       end if
    end do loopite
    return
  end subroutine calcLOBPCG
    
  subroutine eigensystem_real(mat_h,lam,p,nb)
    implicit none
    integer,intent(in)::nb
    real(8),intent(in)::mat_h(1:nb,1:nb)
    real(8),intent(out)::lam(1:nb)
    real(8),intent(out)::p(1:nb,1:nb)    
    integer::lwork
    integer info
    real(8):: work(nb*4)
    
    lwork = nb*4
    p = mat_h
    call dsyev('V','U',nb,p,nb,lam,work,lwork,info)

    return
  end subroutine eigensystem_real
    
  subroutine gram_real(m,n,mat_v,mat_v_out)
    implicit none
    integer,intent(in)::m,n
    real(8),intent(in)::mat_v(1:m,1:n)
    real(8),intent(out)::mat_v_out(1:m,1:n)
    integer::i,j
    real(8)::v(1:m),nai,vi(1:m),viold(1:m)
    real(8)::norm
    mat_v_out = mat_v            
    do i = 1,n
       viold = mat_v_out(:,i)
       do j = 1,i-1
          nai = dot_product(mat_v_out(1:m,j),viold(1:m))
          vi = viold  - nai*mat_v_out(:,j)
          viold = vi
       end do
       norm = sqrt(dble(dot_product(viold,viold)))
       mat_v_out(:,j) = viold/norm
    end do
    return
  end subroutine gram_real

end module LOBPCG

program main
  use LOBPCG,only:calcLOBPCG,eigensystem_real
  implicit none
  integer,parameter::n = 10000
  integer,parameter::md=1
  real(8)::x(1:n,1:md),lam(1:md)
  real(8),allocatable::A(:,:),lamA(:),p(:,:)
  integer::i,j
  real(8)::eps
  integer t1, t2, t_rate, t_max, diff
  external testsubAx
  eps = 1d-6

  call system_clock(t1) 
  call calcLOBPCG(n,testsubAx,md,x,lam,eps)
  call system_clock(t2, t_rate, t_max) 
  if ( t2 < t1 ) then
    diff = t_max - t1 + t2
  else
    diff = t2 - t1
  endif
  write(*,*) "LOBPCG",diff/dble(t_rate),"[s]"
  do i = 1,md
     write(*,*) i,lam(i)
  end do

  allocate(A(1:n,1:n))
  allocate(lamA(1:n),p(1:n,1:n))
  A = 0d0
  do i = 1,n
     j = i
     A(i,j) =0d0*2d0
     j = i -1
     if(j >= 1) A(i,j) = 1d0
     j = i +1
     if(j <= n) A(i,j) = 1d0     
  end do

  call system_clock(t1) 
  call eigensystem_real(A,lamA,p,n)
  call system_clock(t2, t_rate, t_max) 
  if ( t2 < t1 ) then
    diff = t_max - t1 + t2
  else
    diff = t2 - t1
  endif
  write(*,*) "LAPACK",diff/dble(t_rate),"[s]"

  do i = 1,md
     write(*,*) lam(i),lamA(i)
  end do
 
end program main

subroutine testsubAx(n,x,Ax)
  implicit none
  integer,intent(in)::n
  real(8),intent(in)::x(1:n)
  real(8),intent(out)::Ax(1:n)
  integer::i,j
  Ax = 0d0
  do i = 1,n
     j = i
     Ax(i) = Ax(i) + 0d0*2d0*x(j)
     j = i-1
     if(j >=  1) Ax(i) = Ax(i) + 1d0*x(j)
     j = i+1
     if(j <= n) Ax(i) = Ax(i) + 1d0*x(j)
  end do

  return
end subroutine testsubAx
