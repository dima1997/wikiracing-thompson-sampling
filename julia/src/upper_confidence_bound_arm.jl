mutable struct UpperConfidenceBoundArm
    """
    https://fr.wikipedia.org/wiki/Algorithme_UCB
    """
    c::Real # Confidence
    μ::Real # Mean
    N::Real # Number of pulls
end

function UpperConfidenceBoundArm_init()
    CumulativeAverageArm(0, 0)
end

function pull(arm::UpperConfidenceBoundArm)
    n = arm.N
    if arm.N == 0
        n = 1
    end
    arm.μ + arm.c * sqrt(log(n) / n)
end

# function update(arm::UpperConfidenceBoundArm, x::Real)
#     arm.μ = (arm.N * arm.μ + x) / (arm.N + 1)
#     arm.N += 1
#     arm
# end
