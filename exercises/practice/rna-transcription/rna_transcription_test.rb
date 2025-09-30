require 'minitest/autorun'
require_relative 'rna_transcription'

class RnaTranscriptionTest < Minitest::Test
  def test_empty_rna_sequence
    # skip
    actual = Complement.of_dna('')
    expected = ''
    assert_equal expected, actual
  end

  def test_rna_complement_of_cytosine_is_guanine
    skip
    actual = Complement.of_dna('C')
    expected = 'G'
    assert_equal expected, actual
  end

  def test_rna_complement_of_guanine_is_cytosine
    skip
    actual = Complement.of_dna('G')
    expected = 'C'
    assert_equal expected, actual
  end

  def test_rna_complement_of_thymine_is_adenine
    skip
    actual = Complement.of_dna('T')
    expected = 'A'
    assert_equal expected, actual
  end

  def test_rna_complement_of_adenine_is_uracil
    skip
    actual = Complement.of_dna('A')
    expected = 'U'
    assert_equal expected, actual
  end

  def test_rna_complement
    skip
    actual = Complement.of_dna('ACGTGGTCTTAA')
    expected = 'UGCACCAGAAUU'
    assert_equal expected, actual
  end
end
