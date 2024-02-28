using Distributions: Normal, Beta, pdf

mutable struct WikipediaArm
    # path::Vector{String}
    # theoretical_params::Tuple{Float64, Float64}
    μ::Real 
    σ2::Real
end

function WikipediaArm_init(μ::Real, σ2::Real)
    WikipediaArm(μ, σ2)
end

function pull(arm::WikipediaArm)
    # TODO: Support for real connection to Wikipedia
    rand(Normal(arm.μ, arm.σ2))
end

