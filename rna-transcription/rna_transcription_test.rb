#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'rna_transcription'

class ComplementTest < Minitest::Test
  def test_rna_complement_of_cytosine_is_guanine
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

  def test_dna_complement_of_cytosine_is_guanine
    skip
    assert_equal 'G', Complement.of_rna('C')
  end

  def test_dna_complement_of_guanine_is_cytosine
    skip
    assert_equal 'C', Complement.of_rna('G')
  end

  def test_dna_complement_of_uracil_is_adenine
    skip
    assert_equal 'A', Complement.of_rna('U')
  end

  def test_dna_complement_of_adenine_is_thymine
    skip
    assert_equal 'T', Complement.of_rna('A')
  end

  def test_dna_complement
    skip
    assert_equal 'ACTTGGGCTGTAC', Complement.of_rna('UGAACCCGACAUG')
  end

  def test_dna_raises_argument_error
    skip
    assert_raises(ArgumentError) { Complement.of_dna('U') }
  end

  def test_rna_raises_argument_error
    skip
    assert_raises(ArgumentError) { Complement.of_rna('T') }
  end

  def test_rna_raises_argument_error_on_completely_invalid_input
    skip
    assert_raises(ArgumentError) { Complement.of_rna('XXX') }
  end

  def tes_dna_raises_argument_error_on_completely_invalid_input
    skip
    assert_raises(ArgumentError) { Complement.of_dna('XXX') }
  end

  # This test is for the sake of people providing feedback, so they
  # know which version of the exercise you are solving.
  def test_bookkeeping
    skip
    assert_equal 1, Complement::VERSION
  end
end
