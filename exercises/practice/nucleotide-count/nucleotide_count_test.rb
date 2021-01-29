require 'minitest/autorun'
require_relative 'nucleotide_count'

class NucleotideTest < Minitest::Test
  def test_empty_dna_strand_has_no_adenosine
    assert_equal 0, Nucleotide.from_dna('').count('A')
  end

  def test_repetitive_cytidine_gets_counted
    skip
    assert_equal 5, Nucleotide.from_dna('CCCCC').count('C')
  end

  def test_counts_only_thymidine
    skip
    assert_equal 1, Nucleotide.from_dna('GGGGGTAACCCGG').count('T')
  end

  def test_counts_a_nucleotide_only_once
    skip
    dna = Nucleotide.from_dna('CGATTGGG')
    dna.count('T')
    dna.count('T')
    assert_equal 2, dna.count('T')
  end

  def test_empty_dna_strand_has_no_nucleotides
    skip
    expected = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    assert_equal expected, Nucleotide.from_dna('').histogram
  end

  def test_repetitive_sequence_has_only_guanosine
    skip
    expected = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 8 }
    assert_equal expected, Nucleotide.from_dna('GGGGGGGG').histogram
  end

  def test_counts_all_nucleotides
    skip
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    dna = Nucleotide.from_dna(s)
    expected = { 'A' => 20, 'T' => 21, 'G' => 17, 'C' => 12 }
    assert_equal expected, dna.histogram
  end

  def test_validates_dna
    skip
    assert_raises ArgumentError do
      Nucleotide.from_dna('JOHNNYAPPLESEED')
    end
  end
end
