include("./abstract_bandit.jl")
include("../arms/abstract_arm.jl")

"""
https://en.wikipedia.org/wiki/Multi-armed_bandit#
"""
mutable struct ProbMultArmedBandit <: AbstractBandit
    name::String
    est_arms::Vector{AbstractArm}
    real_arms::Vector{AbstractArm}
    real_rewards::Vector{Real}
    regrets::Vector{Real}
end

function ProbMultiArmedBandit_init(name::String, est_arms::Vector{<:AbstractArm}, real_arms::Vector{<:AbstractArm})
    ProbMultArmedBandit(name, est_arms, real_arms, Vector{Real}(), Vector{Real}())
end

function pull_arm(bandit::ProbMultArmedBandit)
    # Pick current best estimation arm
    est_rewards  = [pull(arm) for arm in bandit.est_arms]
    best_arm_idx = argmin(est_rewards)

    # Pull the corresponding real arm
    real_reward  = pull(bandit.real_arms[best_arm_idx]) 
    push!(bandit.real_rewards, real_reward)

    # Update current best estimation arm
    update(bandit.est_arms[best_arm_idx], real_reward)

    # Compute bandit's regret
    regret = bandit_regret(bandit, best_arm_idx)
    push!(bandit.regrets, regret)
    bandit
end

