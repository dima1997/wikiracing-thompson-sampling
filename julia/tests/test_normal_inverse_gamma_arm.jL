using Test
using Random

include("../src/normal_inverse_gamma_arm.jl")

@testset "NormalInverseGammaArm Tests" begin
    Random.seed!(42)
    μ0 = 0
    ν  = 1
    α  = 1
    β  = 1
    arm = NormalInverseGammaArm_init(μ0, ν, α, β)
    prior_reward = pull(arm) 
    @test prior_reward == -0.730285963783429

    observed_reward = 0.9
    update(arm, observed_reward)
    @test pull(arm) == -1.0719292095550224
end;

