# 3.5.2

function MC(N)
    count = 0
    for n=1:N
        x = rand()
        y = rand()
        r = x^2+y^2
        count += ifelse(r > 1,0,1)
    end
    return 4*count/N
end

N = 10000
println(MC(N))
println(MC(N))
println(MC(N))

using Plots
function test()
    ncs = [10^n for n=0:9]
    ms = []
    for nc in ncs
        m = MC(nc)
        push!(ms,abs(π-m)/π)
    end
    println(ms)
    plot(ncs,ms,xscale=:log10,yscale=:log10,markershape = :circle,label="Monte Carlo",xlabel="num",ylabel="relative error")
    savefig("mc.png")
    return
end
test()


function Ransu(N)
    xn = 0:0.01:1
    yn = sqrt.(1 .- xn.^2)
    plot(xn,yn,label=nothing,aspect_ratio=:equal,xlims=(0,1),ylims=(0,1))
    xin = []
    xout = []
    yin = []
    yout = []
    for n=1:N
        x = rand()
        y = rand()
        r = x^2+y^2
        if r >1
            push!(xout,x)
            push!(yout,y)
        else
            push!(xin,x)
            push!(yin,y)
        end
    end
    plot!(xin,yin,label="inside",seriestype = :scatter,markercolor=:blue)
    plot!(xout,yout,label="outside",seriestype = :scatter,markercolor=:yellow)
    savefig("random.png")
    return length(xin)/N
end
N= 1000
Ransu(N)

# 3.6.1

mutable struct Ball
    v::Float64
    mass::Float64
end

function check_collision!(small::Ball,large::Ball)
    r = large.mass/small.mass
    v = small.v
    V = large.v
    
    if v > V
        V_next = (2v+(r-1)V)/(r+1)
        v_next = ((1-r)v+2r*V)/(r+1)
        collision = true
        
        small.v = v_next
        large.v = V_next
        return collision
    elseif v < 0
        collision = true
        small.v = -v
        return collision
    else
        collision = false
        return collision
    end
end

function ballcollision(N)
    v0 = 0.0
    V0 = -1.0
    m = 1
    M = m*100^N
    smallball = Ball(v0,m)
    largeball = Ball(V0,M)
    collision = true
    count = 0
    while collision
        collision = check_collision!(smallball,largeball)
        if collision 
            count += 1
        end
    end
    return count/10^N
end

N = 5
p = ballcollision(N)
println(p)


