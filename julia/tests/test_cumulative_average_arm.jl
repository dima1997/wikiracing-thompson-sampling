using Test
using Random

include("../src/cumulative_average_arm.jl")

@testset "CumulativeAverageArm Tests" begin
    arm  = CumulativeAverageArm_init()
    @test pull(arm) == 0.0
end;

