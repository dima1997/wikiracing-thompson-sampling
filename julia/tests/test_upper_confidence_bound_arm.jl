using Test
using Random

include("../src/upper_confidence_bound_arm.jl")

@testset "UpperConfidenceBoundArm Tests" begin
    confidence = 2
    arm = UpperConfidenceBoundArm_init(confidence)
    prior_reward = pull(arm)
    @test prior_reward == 0.0

    observed_reward = 0.5
    update(arm, observed_reward)
    posterior_reward = pull(arm)
    @test posterior_reward == 0.5
    
    observed_reward_2 = 0.75
    update(arm, observed_reward_2)
    posterior_reward_2 = pull(arm)
    @test posterior_reward_2 == 1.8024100225154747

    @test mean(arm) == 0.625
end;
