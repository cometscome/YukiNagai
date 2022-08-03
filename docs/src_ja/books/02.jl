#2.3.1
function main_2_3_1()
    function g(x,T,nmax;τ=0.01)
        a = 0im
        for n=-nmax:nmax
            ωn = pi*T*(2n+1)
            a += exp(im*ωn*τ)/(im*ωn-x)
        end
        return real(a*T)
    end
    xs = range(-1,1,length=10)


    T = 0.1
    nmax = 100000
    for i=1:10
        println(xs[i],"\t",g(xs[i],T,nmax),"\t",1/(exp(xs[i]/T)+1))
    end

end
main_2_3_1()

# 2.3.2
function main_2_3_2_1()
    function g2(x,T;τ=0.01,nmax=1000000,eps = 1e-8)
        n = 0
        ωn = pi*T*(2n+1)
        a = exp(im*ωn*τ)/(im*ωn-x)
        aold = a
        for n=1:nmax
            ωn = pi*T*(2n+1)
            a += exp(im*ωn*τ)/(im*ωn-x)
            ωn = pi*T*(2*(-n)+1)
            a += exp(im*ωn*τ)/(im*ωn-x)
            if abs(a-aold)/abs(aold) < eps
                println("converged at $n step")
                return T*a
            end
            aold = a
        end
        println("not converged in $nmax step")
        return T*a
    end
    xs = range(-1,1,length=10)

    T = 0.1
    for i=1:10
        println(xs[i],"\t",g2(xs[i],T),"\t",1/(exp(xs[i]/T)+1))
    end
end
main_2_3_2_1()

function main_2_3_2_2()
    function g2(x,T;τ=0.01,eps = 1e-8)
        n = 0
        ωn = pi*T*(2n+1)
        a = exp(im*ωn*τ)/(im*ωn-x)
        aold = 10*a
        while abs(a-aold)/abs(aold) > eps
            aold = a
            n += 1
            ωn = pi*T*(2n+1)
            a += exp(im*ωn*τ)/(im*ωn-x)
            ωn = pi*T*(2*(-n)+1)
            a += exp(im*ωn*τ)/(im*ωn-x)
        end
        println("converged in $n step")
        return T*a
    end


    #g2(0,0.1;τ=0.001,eps=1e-15)
    

end

main_2_3_2_2()

# 2.4.2
function make_matrix(n)
    H  =zeros(n,n)
    for i=1:n
        j = i+1
        j += ifelse(j > n,-n,0)
        H[i,j] = -1
        j = i-1
        j += ifelse(j < 1,n,0)
        H[i,j] = -1
        H[i,i] = 2
    end
    return H
end
make_matrix(10)

# 2.4.8

function y(x,W1,W2,b1,b2)
    xp = W1*x+b1
    m = length(xp)
    f(x) = tanh(x)
    for i=1:m
        xp[i] = f(xp[i])
    end
    wxp = W2*xp
    return wxp[1]+b2
end

x = [1,2,3]
W1 = [1 2 3
    4 5 6]
b1 = [10,11]
W2 = [3 4]
b2 = 3
y(x,W1,W2,b1,b2)

function y2(x,W1,W2,b1,b2)
    f(x) = tanh(x)
    return W2*f.(W1*x+b1) .+ b2
end

y2(x,W1,W2,b1,b2)

# 2.5.2

function Base.:*(x::Int64,y::String)
    z = ""
    for i=1:x
        z*= y
    end
    return z
end
* 

3*"dog"

# 2.5.3
using InteractiveUtils #REPLで実行する場合はこれは不要です。
function get_subtypes(type,num)
    types = subtypes(type)
    num += 1
    if length(types) > 1
        for subtypes in types
            println(num*" ",subtypes)
            types = get_subtypes(subtypes,num)
        end
    end
    return types
end

get_subtypes(Integer,1)


