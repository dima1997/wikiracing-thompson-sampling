include("../arms/abstract_arm.jl")

"""
https://en.wikipedia.org/wiki/Multi-armed_bandit#
"""
mutable struct ProbMultArmedBandit
    name::String
    est_arms::Vector{AbstractArm}
    real_arms::Vector{AbstractArm}
    real_rewards::Vector{Real}
end

function ProbMultiArmedBandit_init(name::String, est_arms::Vector{<:AbstractArm}, real_arms::Vector{<:AbstractArm})
    ProbMultArmedBandit(name, est_arms, real_arms, Vector{Real}())
end

function pull_arm(bandit::ProbMultArmedBandit)
    est_rewards  = [pull(arm) for arm in bandit.est_arms]
    best_arm_idx = argmin(est_rewards)
    real_reward  = pull(bandit.real_arms[best_arm_idx]) 
    update(bandit.est_arms[best_arm_idx], real_reward)
    push!(bandit.real_rewards, real_reward)
    bandit
end

