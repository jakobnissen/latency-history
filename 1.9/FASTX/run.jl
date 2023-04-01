using FASTX
using BioSequences

FASTA.Reader(open("fasta.fna")) do reader
    open("/tmp/delme", "w") do out
        println(out, sequence(LongDNA{2}, first(reader)))
    end
end
