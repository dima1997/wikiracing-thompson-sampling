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

function update(arm::CumulativeAverageArm, x::Real)
    arm.μ = (arm.N * arm.μ + x) / (arm.N + 1)
    arm.N += 1
    arm
end
