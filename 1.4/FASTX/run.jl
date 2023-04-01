using FASTX
using BioSequences

reader = FASTA.Reader(open("fasta.fna"))
out = open("/tmp/delme", "w")
println(out, FASTA.sequence(LongSequence{DNAAlphabet{2}}, first(reader)))
close(out)
close(reader)
