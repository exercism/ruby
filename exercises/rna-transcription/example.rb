module BookKeeping
  VERSION = 3
end

class Complement
  def self.of_dna(strand)
    DNA.new(strand).tr('CGTA', 'GCAU')
  end
end

class DNA < String
  def initialize strand
    strand.chars.map do |n|
      raise ArgumentError, "Illegal DNA Nucleotide: #{n}" unless ['G', 'C', 'T', 'A'].include? n
    end
    super
  end
end
