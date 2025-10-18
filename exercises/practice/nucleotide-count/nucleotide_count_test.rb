require 'minitest/autorun'
require_relative 'nucleotide_count'

class NucleotideTest < Minitest::Test
  def test_empty_strand
    # skip
    expected = { "A" => 0, "C" => 0, "G" => 0, "T" => 0 }
    actual = Nucleotide.from_dna('').histogram
    assert_equal expected, actual
  end

  def test_can_count_one_nucleotide_in_single_character_input
    skip
    expected = { "A" => 0, "C" => 0, "G" => 1, "T" => 0 }
    actual = Nucleotide.from_dna('G').histogram
    assert_equal expected, actual
  end

  def test_strand_with_repeated_nucleotide
    skip
    expected = { "A" => 0, "C" => 0, "G" => 7, "T" => 0 }
    actual = Nucleotide.from_dna('GGGGGGG').histogram
    assert_equal expected, actual
  end

  def test_strand_with_multiple_nucleotides
    skip
    expected = { "A" => 20, "C" => 12, "G" => 17, "T" => 21 }
    actual = Nucleotide.from_dna('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC').histogram
    assert_equal expected, actual
  end

  def test_strand_with_invalid_nucleotides
    skip
    assert_raises ArgumentError do
      Nucleotide.from_dna('AGXXACT')
    end
  end
end
