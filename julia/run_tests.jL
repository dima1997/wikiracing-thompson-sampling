using Test

# Get all the test files in the tests directory
test_files = filter(x -> occursin(r"test_", x), readdir("julia/tests"))

# Run tests in each file
for file in test_files
    include(joinpath("tests", file))
end