using Test
using Random
using SimpleMock

include("../../src/bandits/prob_multi_armed_bandit.jl")
include("../../src/arms/abstract_arm.jl")
include("../../src/arms/beta_arm.jl")
include("../../src/arms/cumulative_average_arm.jl")
include("../../src/arms/normal_inverse_gamma_arm.jl")


@testset "ProbMultiArmedBandit" begin
    Random.seed!(42)
    @testset "Pull All" begin
        name       = ""
        real_arms  = Vector{AbstractArm}([])   
        est_arms   = [BetaArm_init(1,1), CumulativeAverageArm_init(), NormalInverseGammaArm_init(0, 1, 1, 1)]
        bandit     = ProbMultiArmedBandit_init(name, est_arms, real_arms)
        mock_pull  = Mock(pull)
        mock(pull) do mock_pull
            pull_arm(bandit)
            calls_list = calls(mock_pull)
            @test length(calls_list) == length(est_arms)
            @test calls_list[1].args[1] == est_arms[1]
            @test calls_list[2].args[1] == est_arms[2]
            @test calls_list[3].args[1] == est_arms[3]
        end
    end; 
end;

