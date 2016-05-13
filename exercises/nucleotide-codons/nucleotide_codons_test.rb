#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'nucleotide_codons'

class NucleotideCodonsTest < Minitest::Test
  def test_bookkeeping
    assert_equal 1, NucleotideCodons::VERSION
  end

  def test_uncompressed_codon_returns_amino_acid
    skip
    assert_equal 'Serine', NucleotideCodons.amino_acid('AGT')
  end

  def test_compressed_codon_returns_amino_acid
    skip
    assert_equal 'Cysteine', NucleotideCodons.amino_acid('TGY')
  end

  def test_uncompressed_codon_returns_stop
    skip
    assert_equal 'STOP', NucleotideCodons.amino_acid('TAG')
  end

  def test_compressed_codon_returns_stop
    skip
    assert_equal 'STOP', NucleotideCodons.amino_acid('TRA')
  end

  def test_unidentified_codons_return_error
    skip
    assert_raises TypeError do
      NucleotideCodons.amino_acid('ZZZ')
    end
  end
end
