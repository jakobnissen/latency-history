using FASTX
using BioSequences

FASTA.Reader(open("fasta.fna")) do reader
    open("/tmp/delme", "w") do out
        println(out, sequence(LongSequence{DNAAlphabet{2}}, first(reader)))
    end
end
