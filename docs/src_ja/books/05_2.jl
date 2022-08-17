function initialize_spins(Lx,Ly)
    return rand([-1,1],Lx,Ly)
end

function measure_Mz(Ck)
    return sum(Ck)
end

function measure_energy(Ck,J,h,Lx,Ly)
    energy = 0
    for iy=1:Ly
        for ix=1:Lx
            Si = calc_Si(ix,iy,Lx,Ly,Ck)
            σi = Ck[ix,iy]
            energy += -(J/2)*σi*Si - h*σi
        end
    end
    return energy
end

function calc_Si(ix,iy,Lx,Ly,Ck)
    jx = ix + 1
    if jx > Lx
        jx -= Lx
    end
    jy=iy
    Si = Ck[jx,jy]
    
    jx = ix - 1
    if jx < 1
        jx += Lx
    end
    jy = iy
    Si += Ck[jx,jy]
    
    jy = iy + 1
    if jy > Ly
        jy -= Ly
    end
    jx = ix
    Si += Ck[jx,jy]
    
    jy = iy-1
    if jy < 1
        jy += Ly
    end
    jx = ix
    Si += Ck[jx,jy]
    return Si
end

function calc_ΔE(Ck,ix,iy,J,h,Lx,Ly)
    Si = calc_Si(ix,iy,Lx,Ly,Ck)
    return 2J*Ck[ix,iy]*Si + 2h*Ck[ix,iy]
end

function metropolis(σi,ΔE,T)
    is_accepted = ifelse(rand() <= exp(-ΔE/T),true,false)
    σ_new = ifelse(is_accepted,-σi,σi)
    return σ_new,is_accepted
end

function heatbath(σi,ΔE,T)
    α = ΔE*σi
    σ_new = ifelse(rand() <= 1/(1+exp(-α/T)),+1,-1)
    is_accepted = ifelse(σ_new == σi,false,true)
    return σ_new,is_accepted
end


function local_metropolis_update(Ck,ix,iy,T,J,h,Lx,Ly)
    ΔE = calc_ΔE(Ck,ix,iy,J,h,Lx,Ly)
    σi = Ck[ix,iy]
    return metropolis(σi,ΔE,T)
end
function local_heatbath_update(Ck,ix,iy,T,J,h,Lx,Ly)
    ΔE = calc_ΔE(Ck,ix,iy,J,h,Lx,Ly)
    σi = Ck[ix,iy]
    return heatbath(σi,ΔE,T)
end

using Random
using Plots
function montecarlo(num_thermal,num_MC,measure_interval,T,J,h,Lx,Ly)
    Random.seed!(123)
    num_total = num_thermal+num_MC
    accept_count = 0
    absmz_meanvalue = 0
    measure_count = 0
    mz_data = []
    update(Ck,ix,iy) = local_metropolis_update(Ck,ix,iy,T,J,h,Lx,Ly)
    
    Ck = initialize_spins(Lx,Ly)
    
    for trj = 1:num_total
        for isweep = 1:Lx*Ly
            ix = rand(1:Lx)
            iy = rand(1:Ly)
            Ck[ix,iy],is_accepted = update(Ck,ix,iy)
            
            accept_count += ifelse(is_accepted,1,0)
        end
        
        if trj > num_thermal
            if trj % measure_interval == 0
                measure_count += 1
                mz = measure_Mz(Ck)/(Lx*Ly)
                absmz_meanvalue += abs(mz)
                push!(mz_data,mz)
            end
        end 
    end
    return mz_data,accept_count/(num_total*Lx*Ly),absmz_meanvalue/measure_count
                
end

function test()
    Lx = 100
    Ly = 100
    J = 1
    h = 0
    num_thermal = 200
    num_MC = 10000-num_thermal
    measure_interval = 10
    T = 1
    @time mz_data,acceptance_ratio,absmz = montecarlo(num_thermal,num_MC,measure_interval,T,J,h,Lx,Ly)
    println("average acceptance ratio ",acceptance_ratio)
    histogram(mz_data,bin=-1:0.01:1)
    savefig("mz_data_$T.png")
    return
end
test()

function montecarlo_fast(num_thermal,num_MC,measure_interval,T,J,h,Lx,Ly)
    Random.seed!(123)
    num_total = num_thermal+num_MC
    accept_count = 0
    absmz_meanvalue = 0
    measure_count = 0
    mz_data = []
    update(Ck,ix,iy) = local_metropolis_update(Ck,ix,iy,T,J,h,Lx,Ly)
    
    Ck = initialize_spins(Lx,Ly)
    
    for trj = 1:num_total
        if trj > num_thermal && rand() < 0.01 
            @. Ck *= -1
            continue
        end

        for ix = 1:Lx
            for iy=1:Ly
                Ck[ix,iy],is_accepted = update(Ck,ix,iy)
                accept_count += ifelse(is_accepted,1,0)
            end
        end
        
        if trj > num_thermal
            if trj % measure_interval == 0
                measure_count += 1
                mz = measure_Mz(Ck)/(Lx*Ly)
                absmz_meanvalue += abs(mz)
                push!(mz_data,mz)
            end
        end 
    end
    return mz_data,accept_count/(num_total*Lx*Ly),absmz_meanvalue/measure_count
                
end

function test_tdep()
    Lx = 100
    Ly = 100
    J = 1
    h = 0
    num_thermal = 5000
    num_MC = 50000-num_thermal
    measure_interval = 10
    mz_Tdep = []
    nT = 20
    Ts = range(0.5,4.0,length = nT)
    for T in Ts
        @time mz_data,acceptance_ratio,absmz = montecarlo_fast(num_thermal,num_MC,measure_interval,T,J,h,Lx,Ly)
        push!(mz_Tdep,absmz)
        println("$T $absmz")
        histogram(mz_data,bin=-1:0.01:1)
        savefig("mz_data_$(T).png")
    end
    plot(Ts,mz_Tdep)
    savefig("mz_tdep.png")
    return
end

test_tdep()
