include("../arms/abstract_arm.jl")

mutable struct ProbMultArmedBandit
    """
    https://en.wikipedia.org/wiki/Multi-armed_bandit#
    """
    name::String
    est_arms::Vector{<:AbstractArm}
    real_arms::Vector{<:AbstractArm}
    # rewards::Vector{Real}
    # minimize::Bool
end

function ProbMultiArmedBandit_init(name::String, est_arms::Vector{<:AbstractArm}, real_arms::Vector{<:AbstractArm})
    ProbMultArmedBandit(name, est_arms, real_arms) #  Vector{Real}([]), true
end

function pull_arm(bandit::ProbMultArmedBandit)
    est_rewards = [pull(arm) for arm in bandit.est_arms]
    bandit
end

