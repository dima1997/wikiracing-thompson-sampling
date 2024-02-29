import Statistics.mean
include("./abstract_arm.jl")

mutable struct CumulativeAverageArm <: AbstractArm
    μ::Real
    N::Real
end

function CumulativeAverageArm_init()
    CumulativeAverageArm(0, 0)
end

function pull(arm::CumulativeAverageArm)
    mean(arm)
end

function update(arm::CumulativeAverageArm, observation::Real)
    arm.μ = (arm.N * arm.μ + observation) / (arm.N + 1)
    arm.N += 1
    arm
end

function mean(arm::CumulativeAverageArm)
    arm.μ
end