using Test
using Random

include("../src/normal_arm.jl")

@testset "NormalArm Tests" begin
    Random.seed!(42)
    μ = 0
    σ2 = 1
    arm  = NormalArm_init(μ, σ2)
    @test pull(arm) == 0.7883556016042917
end;

