module BookKeeping
  VERSION = 4
end

module Complement
  def self.of_dna(strand)
    strand =~ /[^CGTA]/ ? '' : strand.tr('CGTA', 'GCAU')
  end
end
