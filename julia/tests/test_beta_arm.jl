using Test
using Random

include("../src/beta_arm.jl")

@testset "BetaArm Tests" begin
    Random.seed!(42)
    α  = 1
    β  = 1
    arm = BetaArm_init(α, β)
    prior_reward = pull(arm) 
    @test prior_reward == 0.8023279156644033

    @test mean(arm) == 0.5

    observed_reward = 0.1
    update(arm, observed_reward)
    posterior_reward = pull(arm)
    @test posterior_reward == 0.04885762249758161
end;