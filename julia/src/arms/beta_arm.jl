using Distributions: Beta
import Statistics.mean

include("./abstract_arm.jl")

mutable struct BetaArm <: AbstractArm
    α::Real
    β::Real
end

function BetaArm_init(α::Real, β::Real) 
    BetaArm(α, β)
end

function pull(arm::BetaArm)
    rand(Beta(arm.α, arm.β))
end

function update(arm::BetaArm, observation::Real)
    arm.α += observation 
    arm.β += (1 - observation) 
    arm
end

function mean(arm::BetaArm)
    mean(Beta(arm.α, arm.β))
end
