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
for (version_dir, juliaup_str) in version_pairs
    command = `julia +$(juliaup_str) --startup=no --project=. run.jl`
    for task in tasks
        times[(version_dir, task)] = Float64[]
        cd(joinpath(top_dir, version_dir, task))
        run(command)
        for _ in 1:3
            start = time()
            run(command)
            push!(times[(version_dir, task)], time() - start)
        end
        println(task, '\t', version_dir, '\t', join(times[(version_dir, task)], '\t'))
    end
end

