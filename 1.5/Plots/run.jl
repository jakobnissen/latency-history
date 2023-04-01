using Plots

plt = scatter(rand(10), randn(10))
savefig(plt, "/tmp/delme.svg")
