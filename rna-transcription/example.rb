class Complement
  VERSION = 1

  def self.of_dna(strand)
    DNA.new(strand).tr('CGTA', 'GCAU')
  end

  def self.of_rna(strand)
    RNA.new(strand).tr('GCAU', 'CGTA')
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

class RNA < String
  def initialize strand
    strand.chars.map do |n|
      raise ArgumentError, "Illegal RNA Nucleotide: #{n}" unless ['G', 'C', 'U', 'A'].include? n
    end
    super
  end
end
