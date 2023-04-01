top_dir = pwd()
times = Dict()
tasks = ["FASTX", "DataFrames", "Plots", "JSON3", "JuliaFormatter"]
version_pairs = [
    ("1.4", "1.4"),
    ("1.5", "1.5"),
    ("1.6", "1.6"),
    ("1.7", "1.7"),
    ("1.8", "1.8"),
    ("1.9", "1.9.0-rc1")
]
versions = map(first, version_pairs)
for (version_dir, juliaup_str) in version_pairs
    command = `julia +$(juliaup_str) --startup=no --project=. run.jl`
    for task in tasks
        times[(version_dir, task)] = Float64[]
        cd(joinpath(top_dir, version_dir, task))
        run(`julia +$(juliaup_str) --startup=no --project=. -e "using Pkg; Pkg.instantiate()"`)
    end
end

