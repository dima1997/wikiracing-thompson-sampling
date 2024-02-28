using Distributions: Beta

mutable struct BetaArm
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

# function mean(arm::NormalInverseGammaArm)
#     arm.μ0
# end
