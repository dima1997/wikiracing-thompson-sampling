abstract type AbstractBandit end

function bandit_regret(bandit::AbstractBandit, chosen_arm_idx::Int64)
    chosen_est_arm_mean  = mean(bandit.est_arms[chosen_arm_idx])
    optimal_real_arm_mean = minimum([mean(arm) for arm in bandit.real_arms])
    regret = chosen_est_arm_mean - optimal_real_arm_mean
    return regret > 0 ? regret : 0
end