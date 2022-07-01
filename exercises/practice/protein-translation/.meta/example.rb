class InvalidCodonError < StandardError; end

class Translation

  def self.of_codon(codon)
    found = lookups.keys.find { |sequences| sequences.include?(codon) }
    fail InvalidCodonError unless lookups[found]
    lookups[found]
  end

  def self.of_rna(sequence)
    sequence.chars.each_slice(3).with_object([]) do |codon, output|
      return output if of_codon(codon.join) == 'STOP'
      output << of_codon(codon.join)
    end
  end

  def self.lookups
    {
      ['AUG']             => 'Methionine',
      %w(UUU UUC)         => 'Phenylalanine',
      %w(UUA UUG)         => 'Leucine',
      %w(UCU UCC UCA UCG) => 'Serine',
      %w(UAU UAC)         => 'Tyrosine',
      %w(UGU UGC)         => 'Cysteine',
      ['UGG']             => 'Tryptophan',
      %w(UAA UAG UGA)     => 'STOP'
    }
  end

  private_class_method :lookups

end
