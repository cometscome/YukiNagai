using Plots
function calc_energy(M, μ, ε)
    E = 0
    ks = range(-π, π, length=M)
    filling = 0
    for kx in ks
        εkx = ε(kx) - μ
        if (εkx < 0)
            E += εkx
            filling += 1
        end
    end
    return E / M, filling / M
end

function test2()
    μ = 0
    Ms = [10, 50, 100, 500, 1000, 5000, 10000]
    Es = []
    ε(kx) = -2 * cos(kx)
    for M in Ms
        @time E, filling = calc_energy(M, μ, ε)
        println("$M $E $filling")
        push!(Es, E)
    end
    plot(Ms, Es, xscale=:log10)
    savefig("TB_edep.png")
end
test2()

function test3()
    ε(kx) = -2 * cos(kx)
    M = 1000
    μs = range(-3, 3, length=100)
    fillings = []
    for μ in μs
        E, filling = calc_energy(M, μ, ε)
        push!(fillings, filling)
    end
    plot(μs, fillings, label="filling")
    savefig("TB_mudep.png")
end
test3()

function bisection_method(xmin, xmax, f, eps; itamax=20)
    fmin = f(xmin)
    fmax = f(xmax)
    @assert fmin * fmax < 0 "f(xmin)*f(xmax) should be less than 0!"
    for i = 1:itamax
        xmid = (xmin + xmax) / 2
        fmid = f(xmid)
        if abs(fmid) < eps
            return xmid, fmid
        end
        if fmid < 0
            xmin = xmid
        else
            xmax = xmid
        end
        println("$i $xmid $fmid")
    end
end

function test4()
    filling = 0.25
    M = 1000
    ε(kx) = -2 * cos(kx)
    f(μ) = calc_energy(M, μ, ε)[2] - filling
    eps = 1e-10
    μ_ans, err = bisection_method(-3, 3, f, eps)
    println("μ = $μ_ans, $(calc_energy(M,μ_ans,ε)[2])")
end
test4()

function make_H(N, μ, V)
    H = zeros(Float64, N, N)
    for i = 1:N
        j = i + 1
        j += ifelse(j > N, -N, 0)
        H[i, j] = -1

        j = i - 1
        j += ifelse(j < 1, N, 0)
        H[i, j] = -1

        j = i
        H[i, j] = -μ + V(i)
    end
    return H
end

function make_H(Lx, Ly, μ, V)
    N = Lx * Ly
    H = zeros(Float64, N, N)
    ds = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    for ix = 1:Lx
        for iy = 1:Ly
            i = (iy - 1) * Lx + ix
            for d in ds
                jx = ix + d[1]
                jx += ifelse(jx > Lx, -Lx, 0)
                jx += ifelse(jx < 1, Lx, 0)

                jy = iy + d[2]
                jy += ifelse(jy > Ly, -Ly, 0)
                jy += ifelse(jy < 1, Ly, 0)

                j = (jy - 1) * Lx + jx
                H[i, j] += -1
            end
            H[i, i] += -μ + V(ix, iy)
        end
    end
    return H
end

function calc_ldos(E, i, ene, ψ, η)
    ldos = 0.0
    for n = 1:length(ene)
        ldos += abs(ψ[i, n])^2 * η / ((E - ene[n])^2 + η^2)
    end
    return ldos
end

using LinearAlgebra
function ldos_plot()
    Lx = 91
    Ly = 91
    μ = -0.2 #化学ポテンシャル
    V0 = 1 #不純物の強さ
    ix1 = 22 #不純物のx座標
    iy1 = 38 #不純物のy座標
    function V(ix, iy)
        v = ifelse(ix == ix1 && iy == iy1, V0, 0)
        return v
    end
    H = make_H(Lx, Ly, μ, V)
    @time ene, ψ = eigen(H)
    ldos = zeros(Float64, Lx, Ly)
    η = 0.01 #スメアリングパラメータ
    E = 0 #ゼロエネルギーLDOSを計算
    for ix = 1:Lx
        for iy = 1:Ly
            i = (iy - 1) * Lx + ix
            ldos[ix, iy] = calc_ldos(E, i, ene, ψ, η) #各場所でのLDOSの計算
        end
    end
    heatmap(1:Lx, 1:Ly, ldos[:, :], aspect_ratio=:equal, xlims=(1, Lx), ylims=(1, Ly))
    savefig("TB_ldosplot_$μ.png")
end
ldos_plot()

using FFTW
using LinearAlgebra
function ldos_plot_FFT()
    Lx = 91
    Ly = 91
    μ = -0.2 #化学ポテンシャル
    V0 = 1 #不純物の強さ
    ix1 = 22 #不純物のx座標
    iy1 = 38 #不純物のy座標
    function V(ix, iy)
        v = ifelse(ix == ix1 && iy == iy1, V0, 0)
        return v
    end
    H = make_H(Lx, Ly, μ, V)
    @time ene, ψ = eigen(H)
    ldos = zeros(Float64, Lx, Ly)
    η = 0.01 #スメアリングパラメータ
    E = 0 #ゼロエネルギーLDOSを計算
    for ix = 1:Lx
        for iy = 1:Ly
            i = (iy - 1) * Lx + ix
            ldos[ix, iy] = calc_ldos(E, i, ene, ψ, η) #各場所でのLDOSの計算
        end
    end
    heatmap(1:Lx, 1:Ly, ldos[:, :], aspect_ratio=:equal, xlims=(1, Lx), ylims=(1, Ly))
    savefig("TB_ldosplot_$μ.png")

    ldosfft = fft(ldos)
    ldosfft[1, 1] = 0
    ldosfftshift = fftshift(ldosfft)
    freq = fftshift(fftfreq(Lx, 2π))
    heatmap(freq, freq, abs.(ldosfftshift), aspect_ratio=:equal, xlims=(-π, π), ylims=(-π, π))
    savefig("TB_ldosfft_$μ.png")
end
ldos_plot_FFT()

function fermisurface()
    εk(kx, ky) = -2 * (cos(kx) + cos(ky))
    Nkx = 100
    Nky = 100
    kxs = range(-π, π, length=Nkx)
    kys = range(-π, π, length=Nky)
    μ = -0.2
    energy = zeros(Float64, Nkx, Nky)
    for (ikx, kx) in enumerate(kxs)
        for (iky, ky) in enumerate(kys)
            energy[ikx, iky] = εk(kx, ky) - μ
        end
    end

    contour(kxs, kys, energy, levels=[0], aspect_ratio=:equal, xlabel="kx", ylabel="ky", xlims=(-π, π), ylims=(-π, π), colorbar=false)
    savefig("fermi_$μ.png")
end
fermisurface()


using Optim
function findzero(μ)
    εk(k) = (-2 * (cos(k[1]) + cos(k[2])) - μ)^2
    k0 = 2π * rand(2) .- π
    res = optimize(εk, k0)
    kans = Optim.minimizer(res)
    for i = 1:2
        while kans[i] > π #解は2πの周期関数なので、波数が-πからπに入るように調整
            kans[i] -= 2π
        end
        while kans[i] < -π
            kans[i] += 2π
        end
    end
    println("Fermi momentum: ", kans)
    println("energy= ", εk(kans))
    return kans
end

function fermisurface_arrow()
    εk(kx, ky) = -2 * (cos(kx) + cos(ky))
    Nkx = 100
    Nky = 100
    kxs = range(-π, π, length=Nkx)
    kys = range(-π, π, length=Nky)
    μ = -0.2
    energy = zeros(Float64, Nkx, Nky)
    for (ikx, kx) in enumerate(kxs)
        for (iky, ky) in enumerate(kys)
            energy[ikx, iky] = εk(kx, ky) - μ
        end
    end

    contour(kxs, kys, energy, levels=[0], aspect_ratio=:equal, xlabel="kx", ylabel="ky", xlims=(-π, π), ylims=(-π, π), colorbar=false)
    contour(kxs, kys, energy, levels=[0], aspect_ratio=:equal, xlabel="kx", ylabel="ky", xlims=(-π, π), ylims=(-π, π), colorbar=false)
    npoints = 5
    for i = 1:npoints
        kans1 = findzero(μ) #一つ目のフェルミ波数
        kans2 = findzero(μ) #二つ目のフェルミ波数
        kxpoints = [kans1[1], kans2[1]]
        kypoints = [kans1[2], kans2[2]]
        plot!(kxpoints, kypoints, marker=:circle, arrow=(:closed, 2.0)) #矢印を描くプロット
    end
    savefig("fermi_$μ.png")
end
fermisurface_arrow()