using Test
using Random

include("../../src/bandits/prob_multi_armed_bandit.jl")
include("../../src/arms/abstract_arm.jl")



@testset "ProbMultiArmedBandit" begin
    Random.seed!(42)
    struct CteArm 
        μ::Real
    end 

    function CteArm_init(μ::Real)
        CteArm(μ)
    end

    function pull(arm::CteArm)
        arm.μ
    end

    function update(arm::CteArm, observation::Real)
        arm
    end

    function mean(arm::CteArm)
        arm.μ
    end
    @testset "Pull lowest" begin
        pulls = [0, 0, 0]
        mutable struct TestArm <: AbstractArm
            i::Int64
            pulls::Vector{Int64}
        end 
    
        function TestArm_init(i::Int64, pulls::Vector{Int64})
            TestArm(i, pulls)
        end
    
        function pull(arm::TestArm)
            arm.pulls[arm.i] = 1
        end
    
        function update(arm::TestArm, observation::Real) 
            arm
        end
    
        function mean(arm::TestArm)
            0
        end

        name      = ""
        real_arms = Vector{AbstractArm}([])   
        est_arms  = [TestArm_init(1,pulls), TestArm_init(2, pulls), TestArm_init(3, pulls)]
        bandit    = ProbMultiArmedBandit_init(name, est_arms, real_arms)
        pull_arm(bandit)

        @test sum(pulls) == 3
    end; 
end;

