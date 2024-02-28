import Statistics.mean

mutable struct UpperConfidenceBoundArm
    """
    https://fr.wikipedia.org/wiki/Algorithme_UCB
    """
    confidence::Real    # Confidence
    μ::Real             # Mean
    N::Real             # Number of pulls
end

function UpperConfidenceBoundArm_init(confidence::Real)
    UpperConfidenceBoundArm(confidence, 0, 0)
end

function pull(arm::UpperConfidenceBoundArm)
    n = arm.N
    if arm.N == 0
        n = 1
    end
    arm.μ + arm.confidence * sqrt(log(n) / n)
end

function update(arm::UpperConfidenceBoundArm, observation::Real)
    arm.μ = (arm.N * arm.μ + observation) / (arm.N + 1)
    arm.N += 1
    arm
end

function mean(arm::UpperConfidenceBoundArm)
    arm.μ
end
