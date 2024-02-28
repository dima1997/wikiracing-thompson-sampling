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

# function update(arm::NormalInverseGammaArm, observation::Real)
#     arm.µ0 = (arm.v * arm.µ0 + observation) / (arm.v + 1)
#     arm.v += 1
#     arm.α += 1 / 2
#     arm.β += (arm.v / (arm.v + 1)) * (((observation - arm.µ0) ^ 2) / 2)
#     arm
# end

# function mean(arm::NormalInverseGammaArm)
#     arm.μ0
# end
