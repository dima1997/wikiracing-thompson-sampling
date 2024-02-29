using Distributions: Normal
include("./abstract_arm.jl")

mutable struct NormalArm <: AbstractArm
    μ::Real 
    σ2::Real
end

function NormalArm_init(μ::Real, σ2::Real)
    NormalArm(μ, σ2)
end

function pull(arm::NormalArm)
    rand(Normal(arm.μ, sqrt(arm.σ2)))[1]
end

function mean(arm::NormalArm)
    arm.μ
end

