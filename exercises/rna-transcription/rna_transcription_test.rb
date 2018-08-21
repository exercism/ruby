require 'minitest/autorun'
require_relative 'rna_transcription'

# Common test data version: 1.0.1 cb1fd3a
class RnaTranscriptionTest < Minitest::Test
  def test_rna_complement_of_cytosine_is_guanine
    # skip
    assert_equal 'G', Complement.of_dna('C')
  end

  def test_rna_complement_of_guanine_is_cytosine
    skip
    assert_equal 'C', Complement.of_dna('G')
  end

  def test_rna_complement_of_thymine_is_adenine
    skip
    assert_equal 'A', Complement.of_dna('T')
  end

  def test_rna_complement_of_adenine_is_uracil
    skip
    assert_equal 'U', Complement.of_dna('A')
  end

  def test_rna_complement
    skip
    assert_equal 'UGCACCAGAAUU', Complement.of_dna('ACGTGGTCTTAA')
  end

  def test_correctly_handles_invalid_input_rna_instead_of_dna
    skip
    assert_equal '', Complement.of_dna('U')
  end

  def test_correctly_handles_completely_invalid_dna_input
    skip
    assert_equal '', Complement.of_dna('XXX')
  end

  def test_correctly_handles_partially_invalid_dna_input
    skip
    assert_equal '', Complement.of_dna('ACGTXXXCTTAA')
  end
end
