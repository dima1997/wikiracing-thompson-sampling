using Distributions: Normal, Beta, pdf

mutable struct WikipediaArm
    path::Vector{String}
    theoretical_params::Tuple{Float64, Float64}
end

function WikipediaArm_init(path::Vector{String}, theoretical_params::Tuple{Real, Real})
    WikipediaArm(path, theoretical_params)
end

function WikipediaArm_get_observation(arm::WikipediaArm)
    rand(Normal(arm.theoretical_params[1], arm.theoretical_params[2]))
end

# export WikipediaArm
# export WikipediaArm_init
# export WikipediaArm_get_observation

# import concurrent.futures

# import numpy as np
# from scipy.stats import invgamma

# from src.latency_estimate import get_url_from_article_title, estimate_url_latency

# class WikipediaArm:
#     def __init__(self, path, theoretical_params):
#         self.path = path
#         self.theoretical_params = theoretical_params

#     def get_observation(self):
#         if self.theoretical_params is None:
#             path_urls = [get_url_from_article_title(title) for title in self.path]
#             max_workers = 11
#             with concurrent.futures.ThreadPoolExecutor(max_workers) as executor:
#                 url_latencies = list(executor.map(estimate_url_latency, path_urls))
#             path_latencies = np.sum(url_latencies)
#             return path_latencies
#         else:
#             return np.random.normal(self.theoretical_params[0], self.theoretical_params[1])
