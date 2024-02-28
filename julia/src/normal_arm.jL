using Distributions: Normal

mutable struct NormalArm
    μ::Real 
    σ2::Real
end

function NormalArm_init(μ::Real, σ2::Real)
    NormalArm(μ, σ2)
end

function pull(arm::NormalArm)
    rand(Normal(arm.μ, sqrt(arm.σ2)))[1]
end

