const kB = 1
const N = 1
const ħω = 10
using QuadGK
function gapequation(Δ,T,V)
    f(ξ) = N*V*Δ*tanh((sqrt(Δ^2+ξ^2))/(2kB*T))/(sqrt(Δ^2+ξ^2))
    result = quadgk(f,0,ħω)
    return result[1]
end

function solve_optim(gapequation,T,V,eps=1e-4,maxΔ=1.5)
    gfunc(Δ) = (gapequation(Δ,T,V) - Δ)^2
    res= optimize(gfunc, 1e-10,maxΔ,rel_tol=eps)
    Δ = abs(Optim.minimizer(res)[1]) #Δは正でも負でもどちらでもありうるが、ここでは正の方を取る
    return Δ
end

using Optim
using Plots
function tdep()
    Δ = 1.0
    V = 1.0
    T = 0

    f(V) = (solve_optim(gapequation,0,V)-Δ)^2
    res= optimize(f,0,1.5)
    V = Optim.minimizer(res)[1]
    println("V = ",V)

    nT = 1000
    Ts = range(1e-15,0.6,length=nT)
    
    Δs = []
    @time for T in Ts
        Δ = solve_optim(gapequation,T,V)
        push!(Δs,Δ)
    end
    plot(Ts,Δs,marker=:circle,xlabel="T",ylabel="Delta",label="Optim")
    savefig("Deltas_optim.png")
end
tdep()

function solve_simple(gapequation,T,V,eps=1e-4,initialΔ=1.5)
    Δ = initialΔ
    Δold = 100.0
    res = abs(Δ-Δold)/abs(Δ)
    while res > eps && abs(Δ) > 1e-10
        Δ = abs(gapequation(Δ,T,V))
        res = abs(Δ-Δold)/abs(Δ)
        Δold = Δ
    end
    return Δ
end


function tdep_simple()
    Δ = 1.0
    V = 1.0
    T = 0

    f(V) = (solve_simple(gapequation,0,V)-Δ)^2
    res= optimize(f,0,1.5)
    V = Optim.minimizer(res)[1]
    println("V = ",V)

    nT = 1000
    Ts = range(1e-15,0.6,length=nT)
    
    Δs = []
    @time for T in Ts
        Δ = solve_simple(gapequation,T,V)
        push!(Δs,Δ)
    end
    plot(Ts,Δs,marker=:circle,xlabel="T",ylabel="Delta",label="Optim")
    savefig("Deltas_simple.png")
end
tdep_simple()

function linearized_gapequation(T,V)
    f(ξ) = N*V*tanh(abs(ξ)/(2kB*T))/abs(ξ)
    result = quadgk(f,0,ħω)
    return result[1]
end

function test()
    V = 0.3335340980679235
    findTc(T) = (linearized_gapequation(T,V)-1)^2
    res= optimize(findTc,0,1)
    Tc = Optim.minimizer(res)[1]
    println("Tc = ",Tc)
    println("Theoretical value of Tc = ", 1/1.76)#(2*exp(0.577)/π)*ħω*exp(-1/(N*V)))
end
test()

