using JSON3

d = copy(open(JSON3.read, "in.json"))
open(io -> JSON3.write(io, d), "/tmp/delme.json", "w")
