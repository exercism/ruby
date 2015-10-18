#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'rna_transcription'

# Test data version:
# 0c59846 Added rna-transcription.json test definition

class RnaTranscriptionTest < Minitest::Test
  def test_rna_complement_of_cytosine_is_guanine
    assert_equal 'G', Complement.of_dna('C'),
                 'No, the rna complement of cytosine is guanine.'
  end

  def test_rna_complement_of_guanine_is_cytosine
    skip
    assert_equal 'C', Complement.of_dna('G'),
                 'No, the rna complement of guanine is cytosine.'
  end

  def test_rna_complement_of_thymine_is_adenine
    skip
    assert_equal 'A', Complement.of_dna('T'),
                 'No, the rna complement of thymine is adenine.'
  end

  def test_rna_complement_of_adenine_is_uracil
    skip
    assert_equal 'U', Complement.of_dna('A'),
                 'No, the rna complement of adenine is uracil.'
  end

  def test_rna_complement
    skip
    assert_equal 'UGCACCAGAAUU', Complement.of_dna('ACGTGGTCTTAA'),
                 'No, the rna complement of ACGTGGTCTTAA is UGCACCAGAAUU.'
  end

  def test_dna_complement_of_cytosine_is_guanine
    skip
    assert_equal 'G', Complement.of_rna('C'),
                 'No, the dna complement of cytosine is guanine.'
  end

  def test_dna_complement_of_guanine_is_cytosine
    skip
    assert_equal 'C', Complement.of_rna('G'),
                 'No, the dna complement of guanine is cytosine.'
  end

  def test_dna_complement_of_uracil_is_adenine
    skip
    assert_equal 'A', Complement.of_rna('U'),
                 'No, the dna complement of uracil is adenine.'
  end

  def test_dna_complement_of_adenine_is_thymine
    skip
    assert_equal 'T', Complement.of_rna('A'),
                 'No, the dna complement of adenine is thymine.'
  end

  def test_dna_complement
    skip
    assert_equal 'ACTTGGGCTGTAC', Complement.of_rna('UGAACCCGACAUG'),
                 'No, the dna complement of UGAACCCGACAUG is ACTTGGGCTGTAC.'
  end

  def test_dna_raises_argument_error
    skip
    assert_raises ArgumentError,
                  'Dna must raise an exception on invalid input!' do
      Complement.of_dna('U')
    end
  end

  def test_rna_raises_argument_error
    skip
    assert_raises ArgumentError,
                  'Rna must raise an exception on invalid input!' do
      Complement.of_rna('T')
    end
  end

  def test_dna_raises_argument_error_on_completely_invalid_input
    skip
    assert_raises ArgumentError,
                  'Dna must raise an exception on complelely invalid input!' do
      Complement.of_dna('XXX')
    end
  end

  def test_rna_raises_argument_error_on_completely_invalid_input
    skip
    assert_raises ArgumentError,
                  'Rna must raise an exception on complelely invalid input!' do
      Complement.of_rna('XXX')
    end
  end

  def test_dna_raises_argument_error_on_partially_invalid_input
    skip
    assert_raises ArgumentError,
                  'Dna must raise an exception on partially invalid input!' do
      Complement.of_dna('ACGTXXXCTTAA')
    end
  end

  def test_rna_raises_argument_error_on_partially_invalid_input
    skip
    assert_raises ArgumentError,
                  'Rna must raise an exception on partially invalid input!' do
      Complement.of_rna('UGAAXXXGACAUG')
    end
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of Complement.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 2, Complement::VERSION
  end
end
