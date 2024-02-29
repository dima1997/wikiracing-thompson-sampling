mutable struct FuncArm <: AbstractArm
    i::Int64
    pulls::Vector{Int64}
end 

function TestArm_init(i::Int64, pulls::Vector{Int64})
    TestArm(i, pulls)
end

function pull(arm::TestArm)
    arm.pulls[arm.i] = 1
end

function update(arm::TestArm, observation::Real) 
    arm
end

function mean(arm::TestArm)
    0
end