using Test
using Random

include("../src/normal_arm.jl")

@testset "NormalArm Tests" begin
    Random.seed!(42)
    μ = 0
    σ2 = 1
    arm  = NormalArm_init(μ, σ2)
    prior_reward = pull(arm) 
    @test prior_reward == 0.7883556016042917

    @test mean(arm) == 0.0
end;

