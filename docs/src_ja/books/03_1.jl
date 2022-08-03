# 3.2
#正$(8N)角形の場合は正$(N)角形の場合が正しいです
function sankaku()
    c = sqrt(2)/2
    hankakucos(c) = sqrt((1+c)/2)
    n = 10
    N = 8
    for i=1:n
        c = hankakucos(c)
        N = N*2
        l = sqrt(2 - 2*c)
        println("正$(N)角形の場合：　",N*l/2)
    end
end
sankaku()

function sankaku()
    c = sqrt(2)/2
    hankakucos(c) = sqrt((1+c)/2)
    n = 30
    N = 8
    for i=1:n
        c = hankakucos(c)
        N = N*2
        l = sqrt(2 - 2*c)
        println("正$(N)角形の場合：　",N*l/2,"\t",abs(π-N*l/2)/π)
    end
end
sankaku()

# 3.3.1

function Basel(nc)
    a = 0
    for n=1:nc
        a += 1/n^2
    end
    return sqrt(6a)
end

function test()
    ncs = [1,10,100,1000,10000]
    for nc in ncs
        b = Basel(nc)
        println("バーゼル級数和(nc = $nc): ",b,"\t",abs(π-b)/π)
    end
end
test()

function test()
    ncs = [10^n for n=0:9]
    bs = []
    for nc in ncs
        b = Basel(nc)
        push!(bs,abs(π-b)/π)
    end
    println(bs)
    return ncs,bs
end
ncs,bs = test()

using Plots
plot(ncs,bs)
savefig("basel.pdf")

plot(ncs,bs,xscale=:log10,yscale=:log10,markershape = :circle,label="Basel",xlabel="cutoff num",ylabel="relative error")
savefig("basellog.pdf")

# 3.3.3

function Leibniz(nc)
    a = 0
    for n=0:nc
        a += (-1)^n/(2n+1)
    end
    return 4a
end

function test()
    ncs = [10^n for n=0:9]
    bs = []
    ls = []
    for nc in ncs
        b = Basel(nc)
        l = Leibniz(nc)
        push!(bs,abs(π-b)/π)
        push!(ls,abs(π-l)/π)
    end
    println(bs)
    return ncs,bs,ls
end

ncs,bs,ls = test()

plot(ncs,[bs,ls],xscale=:log10,yscale=:log10,markershape = [:circle :star5],label=["Basel" "Leibniz"],xlabel="cutoff num", ylabel="relative error")

plot(ncs,bs,xscale=:log10,yscale=:log10,markershape = :circle,label="Basel",xlabel="cutoff num",ylabel="relative error")
plot!(ncs,ls,xscale=:log10,yscale=:log10,markershape = :circle,label="Leibniz",xlabel="cutoff num",ylabel="relative error")
savefig("comparison.png")

# 3.3.5

function Ramanujan(nc)
    a = 0
    for n=0:nc
        a += factorial(4n)*(1103+26390n) / (4^n*99^n*factorial(n))^4
    end
    return 99^2/(2 * sqrt(2) * a)
end
r = Ramanujan(1)
println(r,"\t",abs(π-r)/π)

function Ramanujan(nc)
    a = 0
    for n=0:nc
        n = big(n)
        a += factorial(4n)*(1103+26390n) / (4^n*99^n*factorial(n))^4
    end
    return 99^2/(2 * sqrt(big(2)) * a)
end

r = Ramanujan(4)
println(r,"\t",abs(π-r)/π)

# 3.4.1

function Kubun(N,x0,x1,f)
    dx = (x1-x0)/N
    a = 0.0
    xn = range(x0,step=dx,length=N)
    for x in xn
        a += f(x)
    end
    return a*dx
end

f(x) = 4/(1+x^2)
N = 10000
p = Kubun(N,0,1,f)
println(p)

N = 1000000
p = Kubun(N,0,1,f)
println(p)

# 3.4.2

function Daikei(N,x0,x1,f)
    dx = (x1-x0)/N
    a = (f(x0)+f(x1))/2
    xn = range(x0,step=dx,length=N)
    for n=2:N
        x = xn[n]
        a += f(x)
    end 
    return a*dx
end

N = 1000000
p = Daikei(N,0,1,f)
println(p)

# 3.4.3

using QuadGK

f(x) = 4/(1+x^2)
result = quadgk(f,0,1)
println(result[1],"\t error: ",result[2])

