using Test
using Random
using SimpleMock

include("../../src/bandits/prob_multi_armed_bandit.jl")
include("../../src/arms/abstract_arm.jl")
include("../../src/arms/beta_arm.jl")
include("../../src/arms/cumulative_average_arm.jl")
include("../../src/arms/normal_arm.jl")
include("../../src/arms/normal_inverse_gamma_arm.jl")

mutable struct TestArm <: AbstractArm
    id::String
    reward::Int64
    n_pulls::Int64
end 

function TestArm_init(id::String, reward::Int64)
    TestArm(id, reward, 0)
end

function pull(arm::TestArm)
    arm.n_pulls += 1
    arm.reward
end

@testset "ProbMultiArmedBandit" begin
    Random.seed!(42) 
    @testset "Pull Arm" begin
        name       = ""
        real_arms  = [TestArm_init("RA", 1), TestArm_init("RB", 1), TestArm_init("RC", 1)]
        est_arms   = [TestArm_init("EA", 2), TestArm_init("EB", 1), TestArm_init("EC", 3)]
        bandit     = ProbMultiArmedBandit_init(name, est_arms, real_arms)
        pull_arm(bandit)
        @test est_arms[1].n_pulls == 1
        @test est_arms[2].n_pulls == 1
        @test est_arms[3].n_pulls == 1
        @test real_arms[1].n_pulls == 0
        @test real_arms[2].n_pulls == 1
        @test real_arms[3].n_pulls == 0
    end
end

