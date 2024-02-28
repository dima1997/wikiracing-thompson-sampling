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
