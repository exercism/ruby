class NucleotideCodons
  VERSION = 1

  CODON_TABLE = {
    "A" => "A",
    "C" => "C",
    "G" => "G",
    "T" => "T",
    "U" => "U",
    "W" => "A",
    "S" => "C",
    "M" => "A",
    "K" => "G",
    "R" => "A",
    "Y" => "C",
    "B" => "C",
    "D" => "A",
    "H" => "A",
    "V" => "A",
    "N" => "A"
  }

  AMINO_ACIDS = {
    "Alanine" => %w{ GCT GCC GCA GCG },
    "Arginine" => %w{ CGT CGC CGA CGG },
    "Asparagine" => %w{ AAT AAC },
    "Aspartic acid" => %w{ GAT GAC },
    "Cysteine" => %w{ TGT TGC },
    "Glutamine" => %w{ CAA CAG },
    "Glutamic acid" => %w{ GAA GAG },
    "Glycine" => %w{ GGT GGC GGA GGG },
    "Histidine" => %w{ CAT CAC },
    "Isoleucine" => %w{ ATT ATC ATA },
    "Leucine" => %w{ TTA, TTG CTT CTC CTA CTG },
    "Lysine" => %w{ AAA AAG },
    "Methionine" => %w{ ATG },
    "Phenylalanine" => %w{ TTT TTC },
    "Proline" => %w{ CCT CCC CCA CCG },
    "Serine" => %w{ AGT AGC },
    "Threonine" => %w{ ACT ACC ACA ACG },
    "Tryptophan" => %w{ TGG },
    "Tyrosine" => %w{ TAT TAC },
    "Valine" => %w{ GTT GTC GTA GTG },
    "STOP" => %w{ TAA TAG TGA }
  }

  def self.amino_acid(codon)
    codon_array = self.split_codon(codon)
    uncompressed_strand = self.uncompress_codon(codon_array)
    self.find_amino_acid(uncompressed_strand)
  end

  private

  def self.split_codon(codon)
    codon.split("")
  end

  def self.uncompress_codon(codon_array)
    codon_array.each_with_object("") { |element, str| str << CODON_TABLE[element] }
  end

  def self.find_amino_acid(strand)
    AMINO_ACIDS.select { |key, value| value.include?(strand) }.keys.first
  end
end
