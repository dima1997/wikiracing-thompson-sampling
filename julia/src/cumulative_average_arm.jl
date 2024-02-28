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

function update(arm::CumulativeAverageArm, observation::Real)
    arm.μ = (arm.N * arm.μ + observation) / (arm.N + 1)
    arm.N += 1
    arm
end
