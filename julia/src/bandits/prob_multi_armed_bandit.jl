include("../arms/abstract_arm.jl")

mutable struct ProbMultArmedBandit
    """
    https://en.wikipedia.org/wiki/Multi-armed_bandit#
    """
    name::String
    est_arms::Vector{AbstractArm}
    real_arms::Vector{AbstractArm}
end

function ProbMultiArmedBandit_init(name::String, est_arms::Vector{<:AbstractArm}, real_arms::Vector{<:AbstractArm})
    ProbMultArmedBandit(name, est_arms, real_arms)
end

function pull_arm(bandit::ProbMultArmedBandit)
    est_rewards  = [pull(arm) for arm in bandit.est_arms]
    println(est_rewards)
    best_arm_idx = argmin(est_rewards)
    pull(bandit.real_arms[best_arm_idx]) 
    bandit
end

