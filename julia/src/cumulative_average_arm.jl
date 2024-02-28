using Distributions: Normal

mutable struct CumulativeAverageArm
    μ::Real
    N::Real
end

function CumulativeAverageArm_init()
    CumulativeAverageArm(0, 0)
end

function pull(arm::CumulativeAverageArm)
    arm.μ
end
