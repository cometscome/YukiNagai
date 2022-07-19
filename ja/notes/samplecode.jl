a = 1.2 
b = 2.4 
c = a+b
d = a-b

a = 1 + im
b = 2 - im
c = a+b
d = a-b

a = 2
b = 3*a

a = 2
b = 3a

a = 1 + 2im
b = 2 - 4im
c = a+b
d = a-b

a = 1 + 2im
b = 2 - 4im
c = a*b

a = 1 + 2im
b = 2 - 4im
c = a/b

a = 12
b = 4
c = div(a,b)

a = 12
b = 5
d = a %b

a = 12
a += 3
a -= 10
a *= 100
a /= 25

a = 3
b = a^2

a = 2.0
b1 = sin(a)
b2 = cos(a)
b3 = log(a)
b4 = tanh(a)
b5 = atan(a)
b6 = exp(a)

a = 2.0+ 3im
b1 = sin(a)
b2 = cos(a)
b3 = log(a)
b4 = tanh(a)
b5 = atan(a)
b6 = exp(a)

a = 2.0
b = sin(a*π)

# 整数
a = 1
b = 2
c = a + b
println(c)
d = a*b 
println(d)
#=
以下は
実数の場合
=#
a = 1.0
b = 2.2
c = a + b
println(c)
d = a*3b 
println(d)
# 整数の複素数
a = 1+2im
b = 3+4im
c = a + b
println(c)
d = a*3b 
println(d)
# 実数の複素数
a = 1.0+2.0im
b = 3.0+4.0im
c = a + b
println(c)
d = a*3b 
println(d)
#= 円周率πも普通に使えるし、ギリシャ文字も使用可能。
cosやsinもそのまま使用可能
=#
α = π
β = 3π
γ = cos(π+β)
println(γ)
#= 日本語だって使える
=#
りんご = 3
ばなな = 4
総数 = りんご +ばなな
println("りんごの数 $りんご　ばななの数 $ばなな　総数は$総数")
あたらしいりんご = 3
総数 += あたらしいりんご #+=で追加できる。
println("総数は",総数,"となった")


# 結果は実数になる
a = 12
b = 4
c = a/b
println(c)
# 結果は整数になる
a = 12
b = 4
c = div(a,b)
println(c)
# 割り切れない場合
a = 12
b = 5
c = div(a,b)
println(c)
# あまりの計算
a = 12
b = 5
d = a %b
println(c)


# 足し算
function tasu(a,b)
    c = a+b
    return c
end
# 足し算と掛け算
function tasukakeru(a,b)
    c = a+b
    d = a*3b
    return c,d
end
a = 1.0
b = 2.2
c = tasu(a,b)
println(c)
c,d = tasukakeru(a,b)
println("$c,$d")
a = 1.0 +3im
b = 2.2
c = tasu(a,b)
println(c)
c,d = tasukakeru(a,b)
println("$c,$d")
# functionは一行で書くこともできる。
tasu(a,b) = a+b
a = 1.0
b = 2.2
c = tasu(a,b)
println(c)


# 足し算
function tasu(a,b)
    c = a+b
    return c
end
# 足し算
function tasu(a::Complex,b)
    c = a+b+2π
    return c
end
a = 1.0
b = 2.9
c = tasu(a,b)
println(c)
a = 1.0+0.0im
b = 2.9
c = tasu(a,b)
println(c)


# 行列の定義
A = [1 2
3 4]
println(A)
println(typeof(A))
# 別の定義
A = [1　2;3　4]
println(A)
println(typeof(A))
# 要素がゼロの2x2行列
A = zeros(Int64,2,2)
A[1,1] = 1
A[1,2] = 2
A[2,1] = 3
A[2,2] = 4
println(A)
println(typeof(A))
# 要素が1の2x2行列
A = ones(Int64,2,2)
println(A)
println(typeof(A))
# ベクトルの定義
A = [1,2] #これはベクトル。つまり、1次元配列
println(A)
println("ベクトル ",typeof(A))
A = [1 2] #これは上記の
#=
A = [1 2
3 4]
の3,4を削ったかたちなので、1x2行列 =#
println(A)
println("2次元配列 ",typeof(A))
A = [1;2] #これは2x1行列
println(A)
println(typeof(A))

A = [
1 2
3 4
]


a = [
5 
6
]
b = [
7 8 
]

a = [5,6]

A = zeros(3,3)


A[1,2] = 4

A = zeros(Int64,3,3)


A = ones(3,3)
B = rand(3,3)

A = Matrix{Float64}(undef,3,3)

A = [
1 2
3 4
]
B = [
10 20
30 40
]
C = A*B

A = [
1 2
3 4
]
b = [10,20]
C = A*b

A = [
1 2
3 4
]
C = exp(A)

A = [
1 2
3 4
]
C = A .+ 1

A = [
1 2
3 4
]
C = sin.(A)


A = [
1 2
3 4
]
C = exp(A)
D = exp.(A)

A = [1 2
3 4]
B = [10 20
30 40]
function tasu(a,b)
    c = a+b
    return c
end
C = tasu.(A,B)


# コピーする
B = copy(A)
# 別の方法。配列次元がわかっているならこちらのがみやすいかもしれない。
B = A[:,:]

B = A

println("A: $A")
B = A
println("A: $A")
println("B: $B")
A[1,1] = 100
println("A: $A")
println("B: $B")


A = [1 2
3 4]
b = A[:,1]
A = A*b

function make_H1d(N,a) #Nは離散点の数。aは空間の刻み幅
    mat_H = zeros(Float64,N,N) # ハミルトニアンの初期化
    for i in 1:N
        for dx in -1:1
            j = i + dx
            v = 0.0
            if dx == 0
                v = 2/a^2  # 中央
            elseif dx == 1
                v = -1/a^2 #+1方向
            elseif dx == -1
                v = -1/a^2 #-1方向
            end            
            if 1 <= j <= N # 両側に壁があるためこの範囲にのみ制限
                mat_H[i,j] = v
            end            
        end        
    end        
    return mat_H
end


using Plots # プロットするための準備
using LinearAlgebra # 対角化のルーチンeigenを呼ぶ準備
N = 1000 # 差分化した点の総数
a = 0.01 # 空間の刻み幅
mat_H = make_H1d(N,a) # ハミルトニアンの作成
ε,ψ = eigen(mat_H) # 対角化し固有値と固有ベクトルを求める
sn = 200 # プロットする固有値の数を設定

# 解析解と比較するため解析解を用意
εa = zeros(Float64,N) 
for n in 1:N
    εa[n] = n^2*π^2/(a*(N+1))^2 # 解析解を設定
end

# 固有値の最初の200個をプロット
plot([ε[1:sn],εa[1:sn]],label=["Numerical result","Analytical result"],marker=:circle) 
savefig("epea.pdf")

aψ = zeros(Float64,N) # 解析解の用意
for i in 1:N
    xi = i*a
    aψ[i] = sin(xi*π/((N+1)*a)) # 解析解
end
plot([ψ[1:N,1],aψ[1:N]],label=["Numerical result","Analytical result"])
savefig("phi0.pdf") 

aψ = zeros(Float64,N)
for i in 1:N
    xi = i*a
    aψ[i] = sin(xi*π/((N+1)*a))
end
C = sum(dot(aψ[1:N],aψ[1:N]))
aψ = aψ/sqrt(C)
plot([ψ[1:N,1],aψ[1:N]],label=["Numerical result","Analytical result"]) 
savefig("phi_1.pdf")

plot(ψ[1:N,1:6],label=["1st","2nd","3rd","4th","5th","6th"]) 
savefig("phi_16.pdf")

function calc_V(N,V0) # ポテンシャルを計算するfunction
    vec_V = zeros(Float64,N)
    dx = N/6
    for i in 1:N
        if N/2 - dx <= i <= N/2 + dx
            vec_V[i] = V0
        end
    end
    return vec_V
end

V0=1.0
vec_V = calc_V(N,V0) # ポテンシャルの計算
plot(vec_V[1:N],label="Potential")   # ポテンシャルをプロット
savefig("vec_V1.pdf")


function make_H1dv(N,a,V0)
    mat_H = zeros(Float64,N,N)
    vec_V = calc_V(N,V0) # ポテンシャルを計算する        
    for i in 1:N
        for dx in -1:1
            j = i + dx
            v = 0.0
            if dx == 0
                v = (2/a^2 + vec_V[i])
            elseif dx == 1
                v = -1/a^2
            elseif dx == -1
                v = -1/a^2
            end            
            if 1 <= j <= N
                mat_H[i,j] = v
            end            
        end        
    end    
    return mat_H
end

N = 1000 # 差分の点の数
a = 0.01 # 刻み幅
V0 = 1.0 # ポテンシャル強度
mat_H = make_H1dv(N,a,V0) # ハミルトニアンの作成
ε,ψ = eigen(mat_H) # 対角化し固有値と固有ベクトルを求める
plot(ψ[1:N,1],label="Eigenfunction") 
savefig("phi.pdf")


N = 1000
a = 0.01
function gs1(N,a) # 強度依存性を調べるfunction
    groundstates = []
    labels = []
    for v in 1:10
        V0 = v*0.5
        mat_H = make_H1dv(N,a,V0)
        ε,ψ = eigen(mat_H)
        println("Potential = ",V0," Minimum eigenvalue = ",ε[1]) # 最小エネルギーの表示
        push!(groundstates,ψ[:,1]) # 最小エネルギーの波動関数をgroundstatesに格納
        push!(labels,string(V0)) # プロットラベルを作成
    end   
    return groundstates,labels
end
groundstates,labels = gs1(N,a) # 強度依存性を調べる
plot(groundstates,label=labels)  # 結果をプロット
savefig("groundstates1.pdf")

function calc_V(N,V0)
    vec_V = zeros(Float64,N)
    dx = N/6
    center = (N)/2
    for i in 1:N
        vec_V[i] = V0*exp(-(i-center)^2/(dx^2))
    end
    return vec_V
end

N = 1000
V0=1.0
vec_V = calc_V(N,V0)
plot(vec_V[1:N],label="Potential") 
savefig("vec_V2.pdf")


N = 1000
a = 0.01
function gs2(N,a)
    groundstates = []
    labels = []
    for v in 1:10
        V0 = v*0.5
        mat_H = make_H1dv(N,a,V0)
        ε,ψ = eigen(mat_H)
        println("Potential = ",V0," Minimum eigenvalue = ",ε[1])
        push!(groundstates,ψ[:,1])
        push!(labels,string(V0))
    end    
    return groundstates,labels
end
groundstates,labels = gs2(N,a)
plot(groundstates,label=labels) 
savefig("groundstates2.pdf")


N=1000
a = 0.01
dx = N/6
ξ = dx*a
center = (N+1)/2
x0 = center*a
function calc_vq(q,ξ,V0) # vq
    vq = sqrt(π*ξ^2)*exp(-q^2*ξ^2/4)
    return vq
end
function calc_Vkkp(k,kp,ξ,x0,V0) # $V_{k-k'}-V_{-k-k'} -V_{k+k'}+V_{-k+k'}$
    q1 = k - kp
    vq1 = calc_vq(q1,ξ,V0)
    q2 = k + kp
    vq2 = calc_vq(q2,ξ,V0)
    Vkkp = 2*V0*(cos(q1*x0)*vq1 - cos(q2*x0)*vq2)
    return Vkkp
end

function make_Hk(N,a,V0)
    mat_Hk = zeros(Float64,N,N)
    dx = N/6
    ξ = dx*a
    center = (N+1)/2
    x0 = center*a
    L = (N+1)*a
    for n in 1:N
        k = n*π/L
        for np in 1:N
            v = 0.0            
            if n == np
                v = k^2
            end
            kp = np*π/L
            Vkkp = calc_Vkkp(k,kp,ξ,x0,V0) 
            v += Vkkp*(1/2L)
            mat_Hk[n,np]= v
        end
    end
    return mat_Hk
end


V0 = 1.0
N = 1000
a = 0.01
mat_H = make_Hk(N,a,V0)
ep,psi = eigen(mat_H)
println(ep[1])
a = 0.01
rp = zeros(Float64,N)
L = a*N
for i in 1:N
    xi = a*i
    for ik in  1:N
        k = π*ik/L
        rp[i] += psi[ik,1]*sin(k*xi)
    end
end
C = sum(dot(rp[1:N],rp[1:N])) # 規格化
rp = rp/sqrt(C)
plot(rp)
savefig("rp.pdf")

using LinearAlgebra # 線形代数ライブラリを呼び出す
using SparseArrays # 疎行列ライブラリを呼び出す
using Plots # プロットライブラリを呼び出す

function make_mat(N,k,R,L,V0)
    mat_H = spzeros(ComplexF64,N,N) #疎行列を用意
    a = L/(N-1) # 刻み幅
    ε = k^2 # エネルギー
    for i=1:N
        x = (i-1)*a -L/2
        if abs(x) < R # |x| < Rに矩形ポテンシャル
            V = V0
        else
            V = 0
        end
        j = i
        if i == 1
            mat_H[i,j] =-(exp(im*k*a)-2)/a^2-ε
        elseif i==N
            mat_H[i,j] = -(exp(im*k*a)-2)/a^2 -ε
        else
            mat_H[i,j] = 2/a^2+(V-ε)
        end
        j = i + 1
        if j < N+1
            mat_H[i,j] = -1/a^2
        end
        j = i - 1
        if j > 0
            mat_H[i,j] = -1/a^2
        end

    end
    return mat_H
end



function calc_T(N,ne,R,L,V0,emin,emax)
    a = L/(N-1)
    vec_e = range(emin, stop=emax, length=ne)
    T = zeros(Float64,ne) # 透過率
    for ie = 1:ne
        k = sqrt(vec_e[ie])
        mat_H = make_mat(N,k,R,L,V0)
        b = zeros(ComplexF64,N)
        b[1] = (exp(-im*k*a)-exp(im*k*a))/a^2
        x = mat_H \ b　# 連立方程式 H x = bを解く
        T[ie] = abs(x[N])^2
    end
    return T,vec_e./V0
end


N = 1000 # 差分の点の数
L = 10 # システムサイズ
a = L/(N-1) # 刻み幅
V0 = 1
emin = 0.0 # 最小のエネルギー
emax = 2.0 # 最大のエネルギー
ne = 100 # 計算するエネルギーの点の数
R= 1.0 # 矩形ポテンシャルの幅
T1,ene1 = calc_T(N,ne,R,L,V0,emin,emax)
plot(ene1,T1,label="V0=1")
V0 = 4
emin = 0.0 # 最小のエネルギー
emax = 2.0*V0 # 最大のエネルギー
T2,ene2 = calc_T(N,ne,R,L,V0,emin,emax)
plot!(ene2,T2,label="V0=4") # plot!はplotにつづけて重ねる
V0 = 16
emin = 0.0 # 最小のエネルギー
emax = 2.0*V0 # 最大のエネルギー
T3,ene3 = calc_T(N,ne,R,L,V0,emin,emax)
plot!(ene3,T3,label="V0=16")
savefig("T.pdf")

# 完全透過のチェック
V0 = 16
κ = π # 矩形ポテンシャルの波数がマッチした時
k = sqrt(κ^2+V0)
b = zeros(ComplexF64,N)
b[1] = (exp(-im*k*a)-exp(im*k*a))/a^2
mat_H = make_mat(N,k,R,L,V0)
x = mat_H \ b　# 連立方程式 H x = bを解く
plot(real.(x),label="Kappa = pi: Real part")
plot!(imag.(x),label="Kappa = pi: Imaginary part")

V0 = 16
κ = π*0.9 # 矩形ポテンシャルの波数がマッチしていない時
k = sqrt(κ^2+V0)
b = zeros(ComplexF64,N)
b[1] = (exp(-im*k*a)-exp(im*k*a))/a^2
mat_H = make_mat(N,k,R,L,V0)
x = mat_H \ b　# 連立方程式 H x = bを解く
plot!(real.(x),label="Kappa = 0.9pi: Real part")
plot!(imag.(x),label="Kappa = 0.9pi: Imaginary part")

savefig("xs.pdf")







