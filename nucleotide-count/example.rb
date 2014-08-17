class Nucleotide
  def self.from_dna(strand)
    acids = strand.chars
    unless acids.all?(&validate)
      raise ArgumentError.new("Invalid DNA #{strand}")
    end
    new(acids)
  end

  def self.validate
    Proc.new {|acid| %w(A C G T).include?(acid)}
  end

  attr_reader :acids

  def initialize(acids)
    @acids = acids
  end

  def histogram
    {
      'A' => count('A'),
      'T' => count('T'),
      'G' => count('G'),
      'C' => count('C')
    }
  end

  def count(acid)
    acids.count(acid)
  end
end
