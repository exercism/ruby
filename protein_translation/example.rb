class InvalidCodonError < StandardError; end

class Translation
  def self.of_codon(codon)
    found_key = lookups.keys.find { |sequences| sequences.include?(codon) }
    fail InvalidCodonError if lookups[found_key].nil?
    lookups[found_key]
  end

  def self.of_rna(sequence)
    sequence.chars.each_slice(3).with_object([]) do |codon, output|
      return output if of_codon(codon.join) == 'STOP'
      output << of_codon(codon.join)
    end
  end

  private

  def self.lookups
    {
      ['AUG']             => 'Methionine',
      %w(UUU UUC)         => 'Phenylalanine',
      %w(UUA UUG)         => 'Leucine',
      %w(UCU UCC UCA UCG) => 'Serine',
      %w(UAU UAC)         => 'Tyrosine',
      %w(UGU UGC)         => 'Cystine',
      ['UGG']             => 'Tryptophan',
      %w(UAA UAG UGA)     => 'STOP'
    }
  end
end
