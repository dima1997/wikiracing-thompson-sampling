using Test

include("../src/normal_arm.jl")

@testset "NormalArm Tests" begin
    μ = 0
    σ2 = 1
    arm  = NormalArm_init(μ, σ2)
    @test pull(arm) isa Real
end;

