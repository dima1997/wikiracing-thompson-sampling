using Test

include("../src/wikipedia_arm.jl")

@testset "WikipediaArm Tests" begin
    # path = ["link_1", "link_2", "link_3"]
    # theoretical_params = (0,1)
    μ = 0
    σ2 = 1
    arm  = WikipediaArm_init(μ, σ2)
    @test pull(arm) isa Real
end;

