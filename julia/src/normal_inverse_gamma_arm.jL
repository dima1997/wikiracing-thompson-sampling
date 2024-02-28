using ConjugatePriors: NormalInverseGamma

mutable struct NormalInverseGammaArm
    μ0::Real
    v::Real
    α::Real
    β::Real
end

function NormalInverseGammaArm_init(μ0::Real, v::Real, α::Real, β::Real) 
    NormalInverseGammaArm(μ0, v, α, β)
end

function pull(arm::NormalInverseGammaArm)
    rand(NormalInverseGamma(arm.μ0, arm.v, arm.α, arm.β))[1]
end

function update(arm::NormalInverseGammaArm, x::Real)
    arm.µ0 = (arm.v * arm.µ0 + x) / (arm.v + 1)
    arm.v += 1
    arm.α += 1 / 2
    arm.β += (arm.v / (arm.v + 1)) * (((x - arm.µ0) ^ 2) / 2)
    arm
end

function mean(arm::NormalInverseGammaArm)
    arm.μ0
end
