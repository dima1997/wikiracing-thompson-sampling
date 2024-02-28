using Test
using Random

include("../src/upper_confidence_bound_arm.jl")

@testset "UpperConfidenceBoundArm Tests" begin
    arm  = UpperConfidenceBoundArm_init()
    prior_reward = pull(arm)
    @test prior_reward == 0.0

    # observed_reward = 0.5
    # update(arm, observed_reward)
    # posterior_reward = pull(arm)
    # @test posterior_reward == 0.5
    
    # observed_reward_2 = 0.75
    # update(arm, observed_reward_2)
    # posterior_reward_ = pull(arm)
    # @test posterior_reward_ == 0.625
end;