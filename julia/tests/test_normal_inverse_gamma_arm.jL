using Test

include("../src/normal_inverse_gamma_arm.jl")

@testset "NormalInverseGammaArm Tests" begin
    μ0 = 0
    ν  = 1
    α  = 1
    β  = 1
    arm  = NormalInverseGammaArm_init(μ0, ν, α, β)
    @test pull(arm) isa Real
end;

