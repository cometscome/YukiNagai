# 4.2.1

using SpecialFunctions
using Plots
function test()
    N = 100
    xs = range(0,10,length=N)
    for n=0:3
        Jn = besselj.(n,xs)
        Yn = bessely.(n,xs)
        plot!(xs,Jn,label="J$n(x)",ylims=(-1,1))
        plot!(xs,Yn,label="Y$n(x)",ylims=(-1,1))
    end
    savefig("JY.png")
end
test()

plot()

# 4.2.2

using FunctionZeros
function test2()
    R = 10
    N = 100
    Nene = 5
    n = 0
    Es = besselj_zero.(n,1:Nene).^2/R^2
    xs = range(0,10,length=N)
    for (i,E) in enumerate(Es)
        J0 = besselj.(0,xs*sqrt(E))
        plot!(xs,J0,label="$i-th eigenvalue",ylims=(-1,1))
    end
    savefig("J0.png")
end
test2()

using QuadGK
function orthoij(n,i,j)
    αi = besselj_zero(n,i)
    αj = besselj_zero(n,j)
    f(x) = x*besselj(0,αi*x)*besselj(0,αj*x)
    dij,err = quadgk(f,0,1)
    return dij
end

function test3()
    i = 1
    j = 1
    n = 0
    dij = orthoij(n,i,j)
    αi = besselj_zero(n,i)
    println(dij[1]*2/besselj(1,αi)^2)
    i = 1
    j = 2
    dij = orthoij(n,i,j)
    αi = besselj_zero(n,i)
    println(dij[1]*2/besselj(1,αi)^2)
end
test3()

function calc_Vij(n,i,j,R,V)
    αi = besselj_zero(n,i)
    αj = besselj_zero(n,j)
    f(r) = r*V(R*r)*besselj(n,αi*r)*besselj(n,αj*r)
    v,err  = quadgk(f,0,1)
    Vij =v*2/besselj(n+1,αi)^2 
    return Vij
end

function make_H(n,V,N,R)
    H  =zeros(Float64,N,N)
    for i=1:N
        αi = besselj_zero(n,i)
        for j=1:N
            if i==j
                H[i,j] += αi^2/R^2
            end
            Vij = calc_Vij(n,i,j,R,V)
            H[i,j] += Vij
        end
    end
    return H
end

function calc_psi(ci,n,r,R)
    N = length(ci)
    psi = 0
    for i=1:N
        αi = besselj_zero(n,i)
        psi += ci[i]*besselj(n,αi*r/R)
    end
    return psi
end

using LinearAlgebra
function test4()
    R = 10
    V(r) = 2*exp(-(r-R/4)^2/(R/20)^2)
    N = 30
    n  = 0
    H  =make_H(n,V,N,R)
    e,v = eigen(H)
    println(e)
    
    Nx = 100
    xs = range(0,10,length=Nx)
    i1 = 1
    i2 = 2
    psis1 = zero(xs)
    psis2 = zero(xs)
    for (j,x) in enumerate(xs)
        psis1[j] = calc_psi(v[:,i1],n,x,R)
        psis2[j] = calc_psi(v[:,i2],n,x,R)
    end
    plot(xs,psis1,label="$i1-th eigenvalue")
    plot!(xs,psis2,label="$i2-th eigenvalue")
    savefig("JV.png")
end
test4()

# 4.3.1

function timeevolv(ψ,N,Nt,Δt,H)
    ψs = zeros(ComplexF64,N,Nt)
    U = exp(-im*Δt*H)
    for i=1:Nt
        ψ = U*ψ
        ψs[:,i] = ψ
    end
    return ψs
end

function make_H(N,L,V)
    Δx = L/(N+1)
    H = zeros(Float64,N,N)
    for i=1:N
        x = i*Δx
        H[i,i] = V(x)
        j = i+1
        dij = -1/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
        
        j=i
        dij = 2/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
        
        j=i-1
        dij = -1/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
        
    end
    return H
end

function timedep_simple()
    anim = Animation()
    N = 4000
    L = 40.0
    xs = range(0,L,length = N)
    σ =1 
    k0 = 10
    ψ0 = zeros(ComplexF64,N)
    x0 = 5
    @. ψ0 = (π*σ^2)^(-1/4)*exp(-(xs-x0)^2/(2σ^2)+im*k0*(xs-x0))
    dx = (xs[2]-xs[1])/N
    V(x) = 0
    H  = make_H(N,L,V)
    Δt = 0.02
    
    Nt = 100
    c = sqrt(norm(ψ0)^2*dx)
    ψ = ψ0/c
    ψ2max = maximum(abs.(ψ).^2)
    println("norm = $(norm(ψ)^2*dx)")
    @time ψs = timeevolv(ψ,N,Nt,Δt,H)
    
    for i=1:Nt
        plt = plot(xs,abs.(ψs[:,i]).^2,ylims=(0,ψ2max))
        println("$i-th: norm = $(norm(ψs[:,i])^2*dx)")
        frame(anim,plt)
    end
    gif(anim,"sample.gif",fps = 30)
end
timedep_simple()

function make_H!(H,N,L,V)
    @. H = 0
    Δx = L/(N+1)
    for i=1:N
        x = i*Δx
        H[i,i] = V(x)
        
        j=i+1
        dij = -1/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
        
        j = i
        dij = 2/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
        
        j = i-1
        dij = -1/Δx^2
        if 1 ≤ j ≤ N
            H[i,j] += dij
        end
    end
    return
end



N = 4000
L = 40.0
V(x) = 0
H  =zeros(Float64,N,N)
make_H!(H,N,L,V)


using SparseArrays
H = spzeros(Float64,N,N)
make_H!(H,N,L,V)


using KrylovKit
function timeevolv(ψ,N,Nt,Δt,H::SparseMatrixCSC)
    ψs = zeros(ComplexF64,N,Nt)
    for i=1:Nt
        ψ,info = exponentiate(H,-im*Δt,ψ)
        ψs[:,i] = ψ
    end
    return ψs
end

function timedep_simple_sparse()
    anim = Animation()
    N = 4000
    L = 40.0
    xs = range(0,L,length = N)
    σ =1 
    k0 = 10
    ψ0 = zeros(ComplexF64,N)
    x0 = 5
    @. ψ0 = (π*σ^2)^(-1/4)*exp(-(xs-x0)^2/(2σ^2)+im*k0*(xs-x0))
    dx = (xs[2]-xs[1])/N
    V(x) = 0
    H = spzeros(Float64,N,N)
    make_H!(H,N,L,V)
    Δt = 0.02
    
    Nt = 100
    c = sqrt(norm(ψ0)^2*dx)
    ψ = ψ0/c
    ψ2max = maximum(abs.(ψ).^2)
    println("norm = $(norm(ψ)^2*dx)")
    @time ψs = timeevolv(ψ,N,Nt,Δt,H)
    
    for i=1:Nt
        plt = plot(xs,abs.(ψs[:,i]).^2,ylims=(0,ψ2max))
        println("$i-th: norm = $(norm(ψs[:,i])^2*dx)")
        frame(anim,plt)
    end
    gif(anim,"sample.gif",fps = 30)
end
timedep_simple_sparse()

# 4.3.3

function timeevolv(ψ,N,Nt,Δt,H::SparseMatrixCSC)
    ψs = zeros(ComplexF64,N,Nt)
    for i=1:Nt
        ψ = ψ -im*Δt*H*ψ
        ψs[:,i] = ψ
    end
    return ψs
end

function timeevolv(ψ,N,Nt,Δt,H::SparseMatrixCSC)
    ψs = zeros(ComplexF64,N,Nt)
    A = im*Δt*H
    A += I(N)
    for i=1:Nt
        ψ = A \ ψ
        ψs[:,i] = ψ
    end
    return ψs
end

timedep_simple_sparse()

function timeevolv(ψ,N,Nt,Δt,H::SparseMatrixCSC)
    ψs = zeros(ComplexF64,N,Nt)
    A = (im*Δt/2)*H
    B = (-im*Δt/2)*H
    A += I(N)
    B += I(N)

    for i=1:Nt
        ψ = A \ (B*ψ)
        ψs[:,i] = ψ
    end
    return ψs
end

timedep_simple_sparse()

#指数関数の結果より波が遅いのは、t=0.02の時のテイラー展開の1次の精度が悪いからです。

function timedep_simple()
    anim = Animation()
    N = 4000
    L = 40.0
    xs = range(0,L,length=N)
    σ = 1
    k0 = 10
    ψ0 = zeros(ComplexF64,N)
    x0 = 5
    @. ψ0 = (π*σ^2)^(-1/4)*exp(-(xs-x0)^2/(2σ^2)+ im*k0*(xs-x0))
    dx = (xs[2]-xs[1])/N
    x0 = L/2
    V0 = 10
    LV = 5
    function V(x)
        return ifelse(abs(x-x0) < LV/2,V0,0)
    end
    
    H = spzeros(Float64,N,N)
    make_H!(H,N,L,V)
    Δt = 0.02
    Nt = 100
    c = sqrt(norm(ψ0)^2*dx)
    ψ = ψ0/c
    ψ2max = maximum(abs.(ψ).^2)
    
    println("norm = $(norm(ψ)^2*dx)")
    @time ψs = timeevolv(ψ,N,Nt,Δt,H)
    
    for i=1:Nt
        println("energy = ", ψs[:,i]'*H*ψs[:,i]*dx)
        plt = plot(xs,abs.(ψs[:,i]).^2,ylims=(0,ψ2max),label="|psi|")
        plt = vline!([x0-LV/2,x0+LV/2],label = nothing)
        println("$i-th: norm = $(norm(ψs[:,i])^2*dx)")
        frame(anim,plt)
    end
    gif(anim,"simple_V0$(V0)LV$(LV).gif",fps = 30)
end
    
timedep_simple()

function timedep_simple()
    anim = Animation()
    N = 4000
    L = 40.0
    xs = range(0,L,length=N)
    σ = 1
    k0 = 10
    ψ0 = zeros(ComplexF64,N)
    x0 = 5
    @. ψ0 = (π*σ^2)^(-1/4)*exp(-(xs-x0)^2/(2σ^2)+ im*k0*(xs-x0))
    dx = (xs[2]-xs[1])/N
    x0 = L/2
    V0 = 120
    LV = 0.5
    function V(x)
        return ifelse(abs(x-x0) < LV/2,V0,0)
    end
    
    H = spzeros(Float64,N,N)
    make_H!(H,N,L,V)
    Δt = 0.02
    Nt = 100
    c = sqrt(norm(ψ0)^2*dx)
    ψ = ψ0/c
    ψ2max = maximum(abs.(ψ).^2)
    
    println("norm = $(norm(ψ)^2*dx)")
    @time ψs = timeevolv(ψ,N,Nt,Δt,H)
    
    for i=1:Nt
        println("energy = ", ψs[:,i]'*H*ψs[:,i]*dx)
        plt = plot(xs,abs.(ψs[:,i]).^2,ylims=(0,ψ2max),label="|psi|")
        plt = vline!([x0-LV/2,x0+LV/2],label = nothing)
        println("$i-th: norm = $(norm(ψs[:,i])^2*dx)")
        frame(anim,plt)
    end
    gif(anim,"simple_V0$(V0)LV$(LV).gif",fps = 30)
end
    
timedep_simple()











