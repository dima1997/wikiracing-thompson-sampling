using Test

include("../src/wikipedia_arm.jl")

@testset "WikipediaArm Tests" begin
    path = ["link_1", "link_2", "link_3"]
    theoretical_params = (0,1)
    arm  = WikipediaArm_init(path, theoretical_params)
    @test WikipediaArm_get_observation(arm) isa Real
end;

