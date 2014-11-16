class InvalidCodonError < StandardError; end

class Translation

  def self.of_codon (codon)
    found_key = lookups.keys.find { |sequences| sequences.include?(codon)}
    raise InvalidCodonError if lookups[found_key].nil?
    lookups[found_key]
  end

  def self.of_rna(sequence)
    sequence.chars.each_slice(3).with_object([]) do |codon, output|
      return output if of_codon(codon.join) == "STOP"
      output << of_codon(codon.join)
    end
  end

  private

  def self.lookups
    {
      ["AUG"]                      => "Methionine",
      ["UUU", "UUC"]               => "Phenylalanine",
      ["UUA", "UUG" ]              => "Leucine",
      ["UCU", "UCC", "UCA", "UCG"] => "Serine",
      ["UAU", "UAC"]               => "Tyrosine",
      ["UGU", "UGC"]               => "Cystine",
      ["UGG"]                      => "Tryptophan",
      ["UAA", "UAG", "UGA"]        => "STOP"
    }
  end
end
