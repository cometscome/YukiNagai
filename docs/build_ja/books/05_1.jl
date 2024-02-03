# 5.1.2 
function make_initial(numpeople,numchip)
    boxes = zeros(Int64,numpeople)
    for i=1:numchip
        targetbox = rand(1:numpeople)
        boxes[targetbox] += 1
    end
    return boxes
end

function giveandtake(oldboxes)
    newboxes = copy(oldboxes)
    numpeople = length(oldboxes)
    A = rand(1:numpeople)
    B = rand(1:numpeople)
    while B == A
        B = rand(1:numpeople)
    end
    if newboxes[A] > 0
        newboxes[A] -= 1
        newboxes[B] += 1
    end
    return newboxes
end

# 5.1.3
using Plots
function test2()
    numpeople = 6
    numballs = 30
    numgroups = 100
    totalpeople = numpeople*numgroups
    totalboxes = zeros(Int64,numgroups,numpeople)
    for i=1:numgroups
        totalboxes[i,:] = make_initial(numpeople,numballs)
    end
    histogram(totalboxes[:],nbins = -0.5:1:numballs,label = "initial",ylims=(0,totalpeople*0.3))
    savefig("hist.png")
end
test2()

# 5.1.4
function test3()
    numpeople = 6
    numballs = 30
    numgroups = 100
    totalpeople = numpeople*numgroups
    totalboxes = zeros(Int64,numgroups,numpeople)
    for i=1:numgroups
        totalboxes[i,:] = make_initial(numpeople,numballs)
    end
    
    numtotal = 300
    for itrj = 1:numtotal
        for i=1:numgroups
            totalboxes[i,:] = giveandtake(totalboxes[i,:])
        end
    end
    histogram(totalboxes[:],nbins = -0.5:1:numballs,label = "$numtotal",ylims=(0,totalpeople*0.3))
    savefig("hist_300.png")
end
test3()
    

function test3()
    numpeople = 6
    numballs = 30
    numgroups = 100
    totalpeople = numpeople*numgroups
    totalboxes = zeros(Int64,numgroups,numpeople)
    for i=1:numgroups
        totalboxes[i,:] = make_initial(numpeople,numballs)
    end
    
    numtotal = 300
    anim = Animation()
    for itrj = 1:numtotal
        println("$itrj-th")
        for i=1:numgroups
            totalboxes[i,:] = giveandtake(totalboxes[i,:])
        end
        plt = histogram(totalboxes[:],nbins = -0.5:1:numballs,label = "$itrj",ylims=(0,totalpeople*0.3))
        frame(anim,plt)
    end
    gif(anim,"histplot.gif", fps = 30)
    histogram(totalboxes[:],nbins = -0.5:1:numballs,label = "$numtotal",ylims=(0,totalpeople*0.3))
    savefig("hist_300.png")
end
test3()

# 5.1.5
plot();
function test4()
    numpeople = 6
    numballs = 30
    numgroups = 1
    numtotal = 600
    timedepboxes = zeros(Int64,numtotal,numpeople)
    timedepboxes[1,:] = make_initial(numpeople,numballs)
    for itrj = 2:numtotal
        timedepboxes[itrj,:] = giveandtake(timedepboxes[itrj-1,:])
    end
    for i=1:numpeople
        plot!(timedepboxes[:,i],label="$i")
    end
    savefig("history.png")
end
test4()

# 5.1.6
function make_states!(states,allstates,numpeople,numballs,i)
    if i <= length(states)
        for j=0:numballs
            states[i] = j
            make_states!(states,allstates,numpeople-sum(states),numballs,i+1)
        end
    else
        if sum(states) == numballs
            push!(allstates,copy(states))
        end
    end
end

function test5()
    numpeople = 4
    numballs = 4
    states = zeros(Int64,numpeople)
    allstates = []
    make_states!(states,allstates,numpeople,numballs,1)
    println(allstates)
    println("Total number of states: ", length(allstates))
end
test5()

function find_state_id(states,allstates)
    id = findfirst(x -> x == states,allstates)
    return id
end

using Plots
using Measures
function test6()
    numpeople = 4
    numballs = 4
    states = zeros(Int64,numpeople)
    allstates = []
    make_states!(states,allstates,numpeople,numballs,1)
    numtotalstates = length(allstates)
    numstates = zeros(Int64,numtotalstates)
    numgroups  =100
    
    allstatesname = string.(allstates)
    totalpeople = numpeople*numgroups
    
    totalboxes = zeros(Int64,numgroups,numpeople)
    for i=1:numgroups
        totalboxes[i,:] = make_initial(numpeople,numballs)
        id = find_state_id(totalboxes[i,:],allstates)
        numstates[id] += 1
    end
    
    plot(numstates,xticks=(1:1:numtotalstates,allstatesname),
        xrotation = 45,xtickfontsize=6,markershape = :circle,
        margin = 15mm,label="initial",ylims=(0,maximum(numstates)+1))
    savefig("allstateinit.png")
    numtotal = 300
    anim = Animation()
    for itrj = 1:numtotal
        println("$itrj-th")
        for i=1:numgroups
            totalboxes[i,:] = giveandtake(totalboxes[i,:])
            id = find_state_id(totalboxes[i,:],allstates)
            numstates[id] += 1
        end
        plt = plot(numstates,xticks=(1:1:numtotalstates,allstatesname),
        xrotation = 45,xtickfontsize=6,markershape = :circle,
        margin = 15mm,label="$itrj-th",ylims=(0,maximum(numstates)+1))
        frame(anim,plt)
    end
    gif(anim,"allstates.gif",fps=30)
end
test6()

