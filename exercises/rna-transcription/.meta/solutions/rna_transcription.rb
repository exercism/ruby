module Complement
  def self.of_dna(strand)
    raise ArgumentError if strand =~ /[^CGTA]/
    strand.tr('CGTA', 'GCAU')
  end
end
